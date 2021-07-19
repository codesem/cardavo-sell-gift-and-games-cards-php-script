<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Add Pages');

 $fun->do_addpage();

 show('Admin/Pages/add');

?>