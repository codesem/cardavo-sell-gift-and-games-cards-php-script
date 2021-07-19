<?php

 require_once (dirname(dirname(__FILE__)).'/functions.php');

  /* support ticket */
  $fun->do_winfo('Ticket #'.$_GET['id']);
  
  $fun->do_ticket();

 show('Admin/Support/ticket');

?>