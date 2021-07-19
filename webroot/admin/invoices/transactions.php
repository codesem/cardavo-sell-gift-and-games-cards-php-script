<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Transactions');

 $fun->do_transactions();

 show('Admin/Invoices/transactions');

?> 