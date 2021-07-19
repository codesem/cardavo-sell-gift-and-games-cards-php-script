<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');
 
 $fun->do_winfo('SUPPORT');
 
 $fun->do_view_ticket();

 show('User/Support/ticket');
?>