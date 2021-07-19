<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');
 
 $fun->do_winfo('Edit Page');

 $fun->do_updata('pages');

 $fun->do_upage();
 
 show('Admin/Pages/edit');

?>