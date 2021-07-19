<?php

 require_once (dirname(dirname(__FILE__)).'/loader.php');

 $cbs_data = $query->addquery('select','dmethods','*','s','coinbase','methods=?');
 function errorExit($error_msg) {
     die('IPN Error: '.$error_msg);
 } 
 $headers = getallheaders();
 $signraturHeader = isset($headers['X-Cc-Webhook-Signature']) ? $headers['X-Cc-Webhook-Signature'] : null;

 $request = file_get_contents('php://input'); 
 if ($request === FALSE || empty($request)) {
     errorExit('Error reading POST data');
 }
 $hmac = hash_hmac("sha256", $request, trim($cbs_data->ipn));
 if ($hmac != $signraturHeader) {
     errorExit('HMAC signature does not match');
 }
 $jsn_result = json_decode($request, true);
 
 /* data */
 $txn_id = $jsn_result['event']['data']['code'];
 $item_name = $jsn_result['event']['data']['name'];
 $status_text = $jsn_result['event']['type']; 
 $item_number = $jsn_result['event']['data']['metadata']['customer_id'];
 $transaction_id = $jsn_result['event']['payments']['transaction_id'];
 $confirmations_accumulated = $jsn_result['event']['payments']['block']['confirmations_accumulated'];

 /* invoice */
 $invoice = $query->addquery('select','invoice','*','i',$item_number,'id=?');

 if ($status_text == 'charge:created') { 
     
     //created
     $query->addquery('insert','payments','user_id,item_number,txn_id,payment_gross,currency_code,payment_status,type,created','iissssss',[$invoice->user_id,$item_number,$txn_id,$invoice->amount,do_config(16),$status_text,'Coinbase',$dateForm]);
     $query->addquery('update','invoice','status_text=?','si',[$status_text,$item_number],'id=?');
 } else if ($status_text == 'charge:confirmed') { 
     
     /* transaction successful */
     $query->addquery('update','payments','txn_id=?,payment_status=?,payment_gross=?','sssi',[$txn_id,$status_text,$invoice->amount,$item_number],'item_number=?');
     $query->addquery('update','invoice','status=?','si',['on',$item_number],'id=?');
     $query->addquery('update','invoice','status_text=?','si',[$status_text,$item_number],'id=?');
     switch($invoice->type){
         case 1:
             $query->addquery('update','members','balance=balance+?','si',[$invoice->amount,$invoice->user_id],'id=?');
             $query->addquery('insert','notifications','user_id,amount,type,created','isss',[$invoice->user_id,$invoice->amount,'deposit',$dateForm]);
             break;
        case 2:
            $orderid = $query->addquery('insert','orders','user_id,amount,created','iss',[$invoice->user_id,$invoice->amount,$dateForm]);
            $cartjson = json_decode($invoice->cart_json, true);
            $cartjson = $cartjson;
            foreach ($cartjson as $each_item) {
                $prod_id = $each_item['prod_id'];
                $amount = $each_item['amount'];
                $qty = $each_item['qty'];
                $sql = $query->normal("SELECT * FROM ".PFX."cardcodes WHERE status='on' AND prod_id ='$prod_id' AND amount='$amount' LIMIT $qty"); 
                
                //update product
                $query->normal("UPDATE ".PFX."products SET sales=sales+'1' WHERE id ='$prod_id'"); 
                
                /*if($fun->do_item($prod_id,'sales') >= do_config(34) && $fun->do_item($prod_id,'is_popular') == 2){
                    $query->normal("UPDATE ".PFX."products SET is_popular='1' WHERE id ='$prod_id'"); 
                    
                }*/

                $with =array();
                while($res=$sql->fetch_assoc()){
                    $id = $query->normal("INSERT INTO ".PFX."code_orders (order_id, user_id, prod_id, code, amount, created) VALUES ('$orderid', '$invoice->user_id', '".$res['prod_id']."', '".$res['code']."', '".$each_item['price_per_unit']."', '$dateForm')"); 
                    $query->normal("UPDATE ".PFX."cardcodes SET status = 'ex' WHERE id = '".$res['id']."'"); 
                }
            }
            
            //add notification
            $query->addquery('insert','notifications','user_id,amount,type,created','isss',[$invoice->user_id,$invoice->amount,'order',$dateForm]);

            //empty cart (Paid)
            unset($_SESSION["cart"]);
            unset($_SESSION["cart_identify"]);
            $_SESSION["cart_total"] = do_amount(0,false);
            break;
            }
 } else if ($status_text == 'charge:failed') {
     
     //failed
     $query->addquery('update','invoice','status_text=?','si',[$status_text,$item_number],'id=?');
     $query->addquery('update','payments','txn_id=?,payment_status=?,crypto_am=?','sssi',[$txn_id,$status_text,$invoice->amount,$item_number],'item_number=?');
 }else{
     //other
     $query->addquery('update','invoice','status_text=?','si',[$status_text,$item_number],'id=?');
     $query->addquery('update','payments','txn_id=?,payment_status=?,crypto_am=?','sssi',[$txn_id,$status_text,$invoice->amount,$item_number],'item_number=?');
 }
 
 die('IPN OK'); 