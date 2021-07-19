<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');
 
 $fun->do_winfo('Announcements');

 $fun->do_announcements();
 
 $fun->do_activate('announcements','announcements/index');
 
 $fun->do_deactivate('announcements','announcements/index');
 
 $fun->do_delete('announcements','announcements/index');

 show('Admin/Announcements/index');
  
?>