<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');
 
 $fun->do_winfo('Edit User');

 $fun->do_updata('members');

 $fun->do_upuser();
 
 show('Admin/Users/edit');

?>

