<?php

 require_once (dirname(__DIR__)."/loader.php");
 require_once (DATA.'config.php');

 if(isset($_POST['register'])) {

   $username = $_POST['username'];
   $password = md5($_POST['password']);
   $email = $_POST['email'];
   $passwordcheck = md5($_POST['passwordcheck']);
   $website=$_POST['website'];

   if($password == $passwordcheck) {
      $query->addquery('insert','members','username,password,email,role,created','sssss',[$username,$password,$email,'admin',$dateForm]);
       if(!endsWith($website, '/')):
           $website = $website.DS;
       endif;
       $appConfig = get_app($website,Theme,'on','1.1.0',$sr->csrf_token(),'CARDAVO',$dateForm,$dateForm);
       write(CONFIG.'app.php',$appConfig,'w');
       session_acv('success','express_login');
       quick(['origin' => 'installer/admin', 'redirect' => 'signin']);
   } else {
   //pass error
   session_acv('errpass','passfaild');
   quick();
   }
 } else {
   alerts('errpass','passfaild');
 }
 show('Installer/admin');

?>