<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Payments options');
 $fun->do_upayments();

 show('Admin/Options/payment');
 
?>