<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');
 
 $fun->do_winfo('STATEMENT');
 
 $fun->do_notifications(true);

 show('User/Statement/index');
?>