<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Email options');

 $fun->do_upemail();
 
 show('Admin/Options/email');

?>