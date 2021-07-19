<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Edit Product');

 $fun->do_updata('products');
 
 $fun->do_uproduct();

 show('Admin/Products/edit');

?>