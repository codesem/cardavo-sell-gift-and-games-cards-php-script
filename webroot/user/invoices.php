<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');
 
 $fun->do_winfo('INVOICES');
 
 $fun->do_invoices(true);

 show('User/Invoices/index');
?>