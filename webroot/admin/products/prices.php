<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Prices');

 $fun->do_prices();

 $fun->do_activate('prices','products/prices/'.$_GET['id'].DS);

 $fun->do_deactivate('prices','products/prices/'.$_GET['id'].DS);

 $fun->do_delete('prices','products/prices/'.$_GET['id'].DS);

 show('Admin/Products/prices');

?>