<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Themes');

 $fun->do_themes();
 
 $fun->do_extract_theme();

 $fun->do_activate('themes','options/themes');

 $fun->do_deactivate('themes','options/themes');

 $fun->do_delete('themes','options/themes');

 show('Admin/Options/themes');

?>