<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');
 
 $fun->do_winfo('Edit Method');

 $fun->do_updata('currencies');

 $fun->do_upcrn();
 
 show('Admin/Options/edit');

?>