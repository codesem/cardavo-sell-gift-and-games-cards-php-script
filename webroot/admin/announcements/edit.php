<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Edit Announcement ');

 $fun->do_updata('announcements');

 $fun->do_upannouncement();
 
 show('Admin/Announcements/edit');

?>