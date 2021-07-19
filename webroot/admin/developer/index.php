<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Developer Page');

 $smarty->assign('developer',true);

 show('Admin/Developer/index');

?>