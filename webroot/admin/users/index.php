<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Users');

 $fun->do_members();

 $fun->do_activate('members','users/index');

 $fun->do_deactivate('members','users/index');

 $fun->do_delete('members','users/index');

 alerts('users','added');

 show('Admin/Users/index');

?>