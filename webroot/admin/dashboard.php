<?php

 require_once (dirname(dirname(__FILE__)).'/functions.php');

 $fun->do_winfo('Dashboard');

 /* updates notices */

 $fun->do_update_notice();

 /* admin statistics */

 $fun->do_adm_statistics();

 show('Admin/Layout/dashboard');

?>