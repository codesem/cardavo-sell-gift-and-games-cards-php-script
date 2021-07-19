<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');
 
 $fun->do_winfo('ORDERS');
 
 $fun->do_fetch_orders();

 show('User/Orders/index');
?>