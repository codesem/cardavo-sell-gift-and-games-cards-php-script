<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Top Users');

 $fun->do_topusers();

 $fun->do_activate('members','users/top');

 $fun->do_deactivate('members','users/top');

 show('Admin/Users/top');

?>