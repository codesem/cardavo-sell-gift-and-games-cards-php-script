<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Invoices');

 $fun->do_invoices();

 $fun->do_activate('invoice','invoices/index');

 $fun->do_delete('invoice','invoices/index');

 show('Admin/Invoices/index');
 
?>