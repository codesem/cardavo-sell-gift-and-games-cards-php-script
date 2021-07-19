<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Add Product');

 $fun->do_addproduct();

 show('Admin/Products/add');

?>