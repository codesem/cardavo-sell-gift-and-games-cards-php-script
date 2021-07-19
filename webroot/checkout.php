<?php

 require_once ('functions.php');

 $fun->do_winfo('CHECKOUT');
 $fun->do_checkout();

 show('User/Checkout/index');

?>