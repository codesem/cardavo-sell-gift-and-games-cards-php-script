<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Add Codes');

 $fun->do_fetch_products();

 $fun->do_fetch_prices();

 $fun->do_addcardcodes();

 show('Admin/Cardcodes/add');

?>