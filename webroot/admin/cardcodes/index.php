<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Card Codes');

 $fun->do_cardcodes();

 $fun->do_activate('cardcodes','cardcodes/index');

 $fun->do_deactivate('cardcodes','cardcodes/index');

 $fun->do_delete('cardcodes','cardcodes/index');

show('Admin/Cardcodes/index');

?>