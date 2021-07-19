<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');

 $fun->do_winfo('CHANGE_YOUR_PASSWORD');
 
 $fun->do_setuser('password');
 
 show('User/Settings/password');
?>