<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');
 
 $fun->do_winfo('SUPPORT');
 
 $fun->do_fetch_support_tickets();

 show('User/Support/index');
?>