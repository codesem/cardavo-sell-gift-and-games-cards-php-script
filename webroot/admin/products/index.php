<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Products');

 $fun->do_products();

 $fun->do_activate('products','products/index');

 $fun->do_deactivate('products','products/index');

 $fun->do_delete('products','products/index');

 show('Admin/Products/index');

?>