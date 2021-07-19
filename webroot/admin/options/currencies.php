<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Currencies');
 $fun->do_currencies(2);

 show('Admin/Options/currencies');
 
?>