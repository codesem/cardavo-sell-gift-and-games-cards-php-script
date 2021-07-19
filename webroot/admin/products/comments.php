<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Comments');

 $fun->do_comments();
 
 $fun->do_deactivate('comments','products/comments');

 $fun->do_activate('comments','products/comments');

 $fun->do_delete('comments','products/comments');

 show('Admin/Products/comments');

?>