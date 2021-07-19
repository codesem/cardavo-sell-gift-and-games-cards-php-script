<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Reviews');

 $fun->do_reviews();

 $fun->do_deactivate('rating','products/reviews');

 $fun->do_activate('rating','products/reviews');

 $fun->do_delete('rating','products/reviews');

 show('Admin/Products/reviews');

?>