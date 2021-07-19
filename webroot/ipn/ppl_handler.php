<?php

 require_once (dirname(dirname(__FILE__)).'/loader.php');
 
 function emptydata($array){
     $array = explode(',', $array);
     for($i=0; $i < count($array); $i++){
         if(empty(trim($array[$i]))){
             echo 'Error: Wrong data';
             exit;
         }
     }
 }
 if(!isset($_GET['cm'])){
   echo 'Error: No Response';
   exit;
 }
 if(!isset($_GET['tx'])){
   echo 'Error: No Response';
   exit;
 }
 if(!isset($_GET['item_number'])){
   echo 'Error: No Response';
   exit;
 }
 $invoice = $query->addquery('select','invoice','*','i',$_GET['item_number'],'id=?');
      if(!$invoice){
          echo 'Error: Wrong info';
          exit;
      }
      if($invoice->token != $_GET['cm']){
          echo 'Error: Wrong info';
          exit;
      }
         $invoice_number =     $_GET['item_number']; 
         $item_name      =     $_GET['item_name']; 
         $txn_id         =     $_GET['tx']; 
         $payment_gross  =     $_GET['amt']; 
         $currency_code  =     $_GET['cc']; 
         $payment_status =     $_GET['st']; 
         $custom         =     $_GET['cm'];
         $transaction = $query->addquery('select','payments','*','s',$txn_id,'txn_id=?');
         if($transaction){
             echo 'Error: Wrong info';
             exit;
         }
         //check response informations
         emptydata("$invoice_number,$item_name,$txn_id,$payment_gross,$currency_code,$payment_status,$custom");
         
         //check correct payment
         if($payment_gross != $invoice->total){
             echo 'Error: Wrong payment';
             exit;
         }
         if($payment_status == 'Completed'){
            
            /* transaction successful */
            $query->addquery('insert','payments','user_id,item_number,txn_id,payment_gross,currency_code,payment_status,type,created','isssssss',[$invoice->user_id,$invoice_number,$txn_id,$payment_gross,$currency_code,$payment_status,'PayPal',$dateForm]);
            $query->addquery('update','invoice','status=?','si',['on',$invoice_number],'id=?');
            $query->addquery('update','invoice','status_text=?','si',[$payment_status,$invoice_number],'id=?');
            switch($invoice->type){
                case 1:
                    $query->addquery('update','members','balance=balance+?','si',[$invoice->amount,$invoice->user_id],'id=?');
                    $query->addquery('insert','notifications','user_id,amount,type,created','isss',[$invoice->user_id,$invoice->amount,'deposit',$dateForm]);
                    redirect(['controller' => 'user','action' => 'deposit?status=success']);
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

                    $query->addquery('insert','notifications','user_id,amount,type,created','isss',[$invoice->user_id,$invoice->amount,'order',$dateForm]);

                    //empty cart (Paid)
                    unset($_SESSION["cart"]);
                    unset($_SESSION["cart_identify"]);
                    $_SESSION["cart_total"] = do_amount(0,false);
                    
                    session_acv('order','completed');
                    redirect(['controller' => 'user','action' => 'orders']);
                    break;
            }
         }else{
             
            /* transaction failed */
            $query->addquery('insert','payments','user_id,item_number,txn_id,payment_gross,payment_status,type,created','iisssss',[$invoice->user_id,$invoice_number,$txn_id,$payment_gross,$payment_status,'PayPal',$dateForm]);
            redirect(['controller' => 'user','action' => 'deposit?status=failed']);
         }
      