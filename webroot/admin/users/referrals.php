<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Referrals');

 $fun->do_referrals();

 $fun->do_activate('members','users/referrals');

 $fun->do_deactivate('members','users/referrals');

 show('Admin/Users/referrals');

?>