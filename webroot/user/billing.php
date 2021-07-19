<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');
 
 $fun->do_winfo('BILLING');
 
 $fun->do_creditcard_billing();

 show('User/Invoices/billing');
 
?>