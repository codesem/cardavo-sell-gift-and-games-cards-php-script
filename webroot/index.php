<?php

 require_once ('loader.php');
 
 $fun->do_winfo(do_config(9),do_config(8),do_config(29));
 $fun->do_new_products();
 $fun->do_hot_products();

 show('Home/home');
?>