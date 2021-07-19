<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Orders');

 $fun->do_orders();

 $fun->do_activate('orders','orders/index');

 $fun->do_deactivate('orders','orders/index');

 $fun->do_delete('orders','orders/index');

show('Admin/Orders/index');

?>