<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Complete Update');
 $fun->do_complete_update();

 show('Admin/Updates/complete');
 
?>