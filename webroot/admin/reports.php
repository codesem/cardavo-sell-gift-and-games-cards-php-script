<?php

 require_once (dirname(dirname(__FILE__)).'/functions.php');

 $fun->do_winfo('Reports Requests');

 $fun->do_reports();
 
 $fun->do_delete('reports','reports');

 show('Admin/Reports/index');

?>