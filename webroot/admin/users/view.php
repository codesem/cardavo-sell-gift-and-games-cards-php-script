<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('User #'.$_GET['id']);

 $fun->do_updata('members');

 show('Admin/Users/view');

?>