<?php

 require_once (dirname(dirname(__FILE__)).'/functions.php');

 $fun->do_winfo('Support Desk');

 /* support tickets */
 
 $fun->do_support_tickets();

 show('Admin/Support/index');

?>