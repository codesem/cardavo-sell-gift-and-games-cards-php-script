<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Edit Order');

 $fun->do_updata('orders');
 
 $fun->do_uporder();

 show('Admin/Orders/edit');

?>