<?php

 //Warning: we show errors for developing prupose only!
 
 switch (debug):

 case true:
     
 ini_set('display_errors', '1');

 error_reporting( E_ALL );

 ini_set('error_log', LOGS.'errors.log');

 ini_set('log_errors_max_len', 1024);
 
 break;
 
 case false:
     
 ini_set('display_errors', '0');

 ini_set('error_log', LOGS.'errors.log');

 ini_set('log_errors_max_len', 1024);

 break;
 
 endswitch;