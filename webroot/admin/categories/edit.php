<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Edit QA');

 $fun->do_updata('qa');
 
 $fun->do_upqa();

 show('Admin/Qa/edit');

?>