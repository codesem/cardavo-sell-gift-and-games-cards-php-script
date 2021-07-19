<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Edit PTC');

 $fun->do_updata('ptc');
 
 $fun->do_uptc();

 show('Admin/Ptc/edit');

?>