<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Detected IP(s)');

 $fun->do_banlist();

 $fun->do_activate('banlist','banlist/index');

 $fun->do_deactivate('banlist','banlist/index');
 
 $fun->do_delete('banlist','banlist/index');

show('Admin/Banlist/index');

?>