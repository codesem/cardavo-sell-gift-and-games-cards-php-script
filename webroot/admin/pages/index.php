<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Pages');

 $fun->do_pages(true);

 $fun->do_activate('pages','pages/index');

 $fun->do_deactivate('pages','pages/index');

 $fun->do_delete('pages','pages/index');

show('Admin/Pages/index');

?>