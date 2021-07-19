<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');
 
 $fun->do_winfo('Add User');

 $fun->do_adduser();
 
 show('Admin/Users/add');

?>

