
<?php

 /*
 |--------------------------------------------------------------------------
 | Database Connection
 |--------------------------------------------------------------------------
 |
 | Here you may specify which of the database connection below you wish
 | to use, Please provide us with database username & password & name & host
 |
 */

class SystemComponent{

private $settings;

function getSetting(){

$settings['dbperfix']='ca_';

$settings['dbusername']='id17058068_cardavo_user';

$settings['dbpassword']='5bUH^zhy|_0[l?f)'; 

$settings['dbname']='id17058068_cardavo';

$settings['dbhost']='localhost';

return $settings;

	}

}
