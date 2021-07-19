<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Add Announcement');

 $fun->do_addannoce();

 show('Admin/Announcements/add');

?>