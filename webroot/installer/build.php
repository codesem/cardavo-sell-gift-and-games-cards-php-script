<?php

require_once (dirname(__DIR__)."/loader.php");
require_once (DATA.'config.php');

 if(isset($_POST['build']) ){

  //FILE==SQL
  $filename = (DATA.'data.sql');
  $templine = '';
  $lines = file($filename);

  foreach ($lines as $line){

   if (substr($line, 0, 2) == '--' || $line == '')
   continue;
   $templine .= $line;
     if (substr(trim($line), -1, 1) == ';'){
      $query->build($templine);
      $templine = '';
	}
  }
   quick(['origin' => 'installer/build', 'redirect' => 'installer/admin']);
 }

show('Installer/build');

?>