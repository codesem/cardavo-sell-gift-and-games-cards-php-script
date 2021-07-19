<?php

require_once (dirname(__DIR__).'/loader.php');
require_once (DATA.'config.php');

$check = true;
$smarty->assign('build',false);

//PHP==VERSION
if (version_compare(PHP_VERSION, '7.0.0', '>=')) {
}
else{
$check = false;
$smarty->assign('msg',('<div class="alert alert-danger text-center" >Your PHP version must be equal or higher than 7.0.0 to use our script. Please ask your hosting company to update it.</div>'));
}

//EXTENSION==OPENSSL
if (!extension_loaded('openssl')) {
$check = false;
$smarty->assign('msg','<div class="alert alert-danger text-center" >We didnt find openssl extension enabled . Please ask your hosting company to enable it.</div>');
}

//EXTENSION==CURL
if (!extension_loaded('curl')) {
$check = false;
$smarty->assign('msg','<div class="alert alert-danger text-center" >We didnt find curl extension enabled . Please ask your hosting company to enable it.</div>');
}

//EXTENSION==ZIP
if (!extension_loaded('zip')) {
$check = false;
$smarty->assign('msg','<div class="alert alert-danger text-center" >We didnt find zip extension enabled . Please ask your hosting company to enable it.</div>');
}

//EXTENSION==ndmysqli
if (!function_exists('mysqli_stmt_get_result')) {
$check = false;
$smarty->assign('msg','<div class="alert alert-danger text-center" >We didnt find nd_mysqli extension enabled . Please ask your hosting company to enable it.</div>');
}

//CHECK==OK
if($check){
$smarty->assign('build',true);
$smarty->assign('msg',('<div class="alert alert-success text-center" >Installation can continue now.</div>'));
}

show('Installer/index');

?>