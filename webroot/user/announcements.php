<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');

 $fun->do_winfo('ANNOUNCEMENTS');
 
 $fun->do_announcements(true);

 show('User/Announcements/index');

?>