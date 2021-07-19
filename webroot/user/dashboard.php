<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');

 $fun->do_winfo('DASHBOARD');
 
 $fun->do_user_statistics();

 show('User/Layout/dashboard');

?>