<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Add IP(s)');

 $fun->do_addip();

show('Admin/Banlist/add');

?>