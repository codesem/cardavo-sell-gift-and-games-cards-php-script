<?php

 if ($info->install == 'on'):
  redirect(['action'=> 'home']);
 endif;

 if(isset($_SESSION['ACCESS'])):
  $HOST = $HOST.$_SESSION['ACCESS'].DS;
 else:
  $HOST = $HOST;
 endif;
 
 $smarty->assign('HOST',$HOST);
 $smarty->assign('THEME',Theme);
 $smarty->assign('date',Year);

 function check_conn_db($host,$user,$pass,$dbname){
   $mycheck = new mysqli($host, $user, $pass, $dbname);
   if($mycheck->connect_errno):
    return true;
   else:
    return false;
   endif;

  }

?>