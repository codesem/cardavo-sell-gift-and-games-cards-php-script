<?php

 /*
 |--------------------------------------------------------------------------
 | checkoutModel
 |--------------------------------------------------------------------------
 |
 | Payments checkouts can be found here.
 | In main time only Coinbase/PayPal/Stripe are supported.
 |
 */
 
 class checkouts{
      public function coinbase($name,$number,$amount,$currency,$type=1){
       global $query,$user;
       require(CBS.'coinbase.inc.php');
       $cps = new CoinbaseAPI();
       $data = $query->addquery('select','dmethods','*','s','coinbase','methods=?');
       $cps->Setup($data->public_key);
       $invoice = $query->addquery('select','invoice','*','i',$number,'id=?');
       switch($type){
           case '1':
               $failurl = HOST.USR.'deposit?status=failed';
               $successurl = HOST.USR.'deposit?status=success';
               break;
           case '2':
               $failurl = HOST.'checkout';
               $successurl = HOST.USR.'orders';
               break;
       }
       
       $req = array(
           
           'name' => 'DEPOSIT #'.$number,
           'description'=> $name,
           'pricing_type' => 'fixed_price',
           'local_price' => ["amount"=> $amount,
           "currency"=> $currency],
           'metadata' => ["customer_id"=> $number,
           "customer_name"=> $user->first_name ?:$user->username],
           'redirect_url' => $successurl,
           'cancel_url' => $failurl
       );

       $result = $cps->CreateTransaction($req);
       if (isset($result['error'])) {
               session_acv('checkout','error');
               $_SESSION['checkout']['msg'] = 'Error: ' .$result['error'];
               if($type == 1){
                   redirect(['controller' => 'user','action' => 'deposit']);
               }else{
                   redirect(['action' => 'checkout']);
               }
             }else{
               header('location:' .$result['data']['hosted_url']);
	           exit;
           }
       }
      public function paypal($name,$number,$amount,$currency,$type=1){
       global $query;
       require(PPL.'paypal.inc.php');
       $ppl = new PayPalAPP();
       $data = $query->addquery('select','dmethods','*','s','paypal','methods=?');
       $invoice = $query->addquery('select','invoice','*','i',$number,'id=?');
       $ppl->Setup($invoice->token);

       switch($type){
           case '1':
               $succurl = HOST.USR.'deposit?status=success';
               $failurl = HOST.USR.'deposit?status=failed';
               break;
           case '2':
               $succurl = HOST.USR.'orders';
               $failurl = HOST.'checkout';
               break;
       }
       $req = array(
         
         'cmd' => '_xclick',
         'charset' => 'utf-8',
         'item_name' => $name,
         'item_number'=> $number,
         'amount' => $amount,
         'business' => $data->account,
         'notify_url' => HOST.IPN.'ppl_handler',
         'return' => $succurl,
         'cancel_return' => $failurl
       );
       $result = $ppl->ExpressCheckout($req);
       if (isset($result['error'])) {
               session_acv('checkout','error');
               $_SESSION['checkout']['msg'] = 'Error: ' .$result['error'];
               if($type == 1){
                   redirect(['controller' => 'user','action' => 'deposit']);
               }else{
                   redirect(['action' => 'checkout']);
               }
             }else{
                 //var_export($result['hosted_url']);exit;
               header('location:' .$result['hosted_url']);
	           exit;
           }
       }
      public function stripe($name,$number,$amount,$currency,$type=1){
       global $query,$user,$dateForm;
       require(STP.'init.php');

       $data = $query->addquery('select','dmethods','*','s','stripe','methods=?');
       $stripe = new \Stripe\StripeClient($data->secret_key);
       $invoice = $query->addquery('select','invoice','*','i',$number,'id=?');
       $amount = number_format(($amount*100) , 0, '', '');

       switch($type){
           case '1':
               $succurl = HOST.USR.'deposit?status=success';
               $failurl = HOST.USR.'deposit?status=failed';
               break;
           case '2':
               $succurl = HOST.USR.'orders';
               $failurl = HOST.'checkout'.DS.$number.DS;
               break;
       }

           $token = $_POST['stripeToken'];
           
           try {
               $charge = $stripe->charges->create([
                   'amount' => $amount,
                   'currency' => strtolower($currency),
                   'source' => $token
               ]);    
           } catch (\Stripe\Exception\CardException $e) {       
               $_SESSION['checkout']['msg'] = $e->getError()->message;
               session_acv('checkout','error');
               header('location:' .$failurl);
               exit;
           } catch (\Stripe\Exception\RateLimitException $e) {
               // Too many requests made to the API too quickly
               $_SESSION['checkout']['msg'] = $e->getError()->message;
               session_acv('checkout','error');
               header('location:' .$failurl);
               exit;
           } catch (\Stripe\Exception\AuthenticationException $e) {
               $_SESSION['checkout']['msg'] = $e->getError()->message;
               session_acv('checkout','error');
               header('location:' .$failurl);
               exit;
           } catch (\Stripe\Exception\InvalidRequestException $e) {
               $_SESSION['checkout']['msg'] = $e->getError()->message;
               session_acv('checkout','error');
               header('location:' .$failurl);
               exit;
           } catch (\Stripe\Exception\ApiConnectionException $e) {
               // Network communication with Stripe failed
               $_SESSION['checkout']['msg'] = $e->getError()->message;
               session_acv('checkout','error');
               header('location:' .$failurl);
               exit;
           } catch (\Stripe\Exception\ApiErrorException $e) {
               // Network communication with Stripe failed
               $_SESSION['checkout']['msg'] = $e->getError()->message;
               session_acv('checkout','error');
               header('location:' .$failurl);
               exit;
           } catch (Exception $e) {
               //catch any non-stripe exceptions
               $_SESSION['checkout']['msg'] = $e->getError()->message;
               session_acv('checkout','error');
               header('location:' .$failurl);
               exit;
           }

       if($charge->status == 'succeeded'){
          //enter into DB
          if($type == 1){
             $query->addquery('update','invoice','status=?','si',['on',$number],'id=?');
             $query->addquery('insert','payments','user_id,item_number,txn_id,payment_gross,payment_status,type,created','iisssss',[$invoice->user_id,$number,$charge->txn_id,$invoice->amount,$charge->status,'Stripe',$dateForm]);
             $query->addquery('update','members','balance=balance+?,deposit_balance=deposit_balance+?','ssi',[$invoice->amount,$invoice->amount,$invoice->user_id],'id=?');
             $query->addquery('insert','notifications','user_id,amount,type,created','isss',[$invoice->user_id,$invoice->amount,'deposit',$dateForm]);
          }elseif($type == 2){
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
              session_acv('order','completed');
          }
             header('location:' .$succurl);
	         exit;
       }else{
             $query->addquery('insert','payments','user_id,item_number,txn_id,payment_gross,payment_status,type,created','iisssss',[$invoice->user_id,$number,$charge->txn_id,$invoice->amount,$charge->status,'Stripe',$dateForm]);
             header('location:' .$failurl);
	         exit;
       }



      
 
    
       }
  }