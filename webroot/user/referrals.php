<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');
 
 $fun->do_winfo('REFERRALS');
 
 $fun->do_useref_statistics();

 show('User/Referrals/index');
?>