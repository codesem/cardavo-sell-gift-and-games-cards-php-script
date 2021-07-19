<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Modify Price');

 $fun->do_updata('prices');

 $fun->do_uprices();

 show('Admin/Products/uprice');

?>