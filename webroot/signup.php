<?php

 require_once ('loader.php');

 $fun->do_winfo('SIGN_UP');

 /* start signup*/

 $fun->do_signup();

 show('OAuth/signup');

?>