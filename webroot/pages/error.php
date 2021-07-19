<?php

 require_once (dirname(dirname(__FILE__)).'/loader.php');

 $fun->do_winfo('CSRF_TOKEN_MISMATCH');

 show('Pages/Errors/index');

?>