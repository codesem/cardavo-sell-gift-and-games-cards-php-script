<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');
 
 $fun->do_winfo('DEPOSIT');
 
 $fun->do_deposit();

 show('User/Invoices/deposit');
?>