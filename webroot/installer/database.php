<?php

require_once (dirname(__DIR__)."/loader.php");
require_once (DATA.'config.php');

 if(isset($_POST['install']) ):

  $host=$_POST['host'];
  $user=$_POST['user'];
  $pass=$_POST['pass'];
  $dbname=$_POST['dbname'];

  if(check_conn_db($host,$user,$pass,$dbname)):
   session_acv('errmysqli','faild');
   quick();
  endif;

  $system = get_system($host,$user,$pass,$dbname);
  $requirements = get_requirements();
  write(CONNECT.'system.class.php',$system,'w');

  $fname = WWW_ROOT.'index.php';
  $fhandle = fopen($fname,"r");
  $content = fread($fhandle,filesize($fname));
  $content = str_replace("//REQUIREMENT", "$requirements", $content);
  write($fname,$content,'w');
  quick(['origin' => 'installer/database', 'redirect' => 'installer/build']);
 else:
  alerts('errmysqli','faild');
 endif;
 
show('Installer/db');

?>