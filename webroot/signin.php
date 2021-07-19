<?php

 require_once ('loader.php');

 $fun->do_winfo('SIGN_IN');

 /* start login*/
 
 $fun->do_login();

 show('OAuth/signin');

?>