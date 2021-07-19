<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Options');

 $fun->do_options();
 
 show('Admin/Options/index');

?>