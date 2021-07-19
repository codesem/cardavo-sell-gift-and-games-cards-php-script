<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Developer FAQs');
 
 $smarty->assign('faqs',true);

 show('Admin/Developer/faqs');

?>