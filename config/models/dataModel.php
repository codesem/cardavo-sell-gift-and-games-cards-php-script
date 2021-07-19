<?php

 /*
 |--------------------------------------------------------------------------
 | dataModel
 |--------------------------------------------------------------------------
 |
 | Some configuration data stored here.
 |
 */
 
   function get_requirements()
   {

$config = <<<END
/*
==== WE ARE CHECKING IF YOUR VERSION HIGHER OR EQUAL TO 7.0.0.================//
== YOU CAN REMOVE THIS IF YOU ARE CONFIDENT THAT YOUR PHP VERSION IS SUFFICIENT.
*/
if (!version_compare(PHP_VERSION, '7.0.0', '>=')) {
    exit('Your PHP version must be equal or higher than 7.0.0 to use our script. Please ask your hosting company to update it.');
}

/*
=============== WE ARE CHECKING IF CURL EXTENTION IS ENABLED ================//
== YOU CAN REMOVE THIS IF YOU ARE CONFIDENT THAT YOUR PHP VERSION IS SUFFICIENT.
*/
if (!_is_curl_installed()) {
  exit ("cURL is NOT installed you need it to use our script, Please ask your hosting company to include it.");
    
}

/*
=============== WE ARE CHECKING IF OpenSSL EXTENTION IS ENABLED ==============//
== YOU CAN REMOVE THIS IF YOU ARE CONFIDENT THAT YOUR PHP VERSION IS SUFFICIENT.
*/
if (!extension_loaded('openssl')) {
 exit("OpenSSL is NOT installed, Please ask your hosting company to include it.");
}
END;
       return $config;

   }
   
   function get_system($host,$user,$pass,$dbname,$pfx='ca_')
   {

$config = <<<END

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

private \$settings;

function getSetting(){

\$settings['dbperfix']='$pfx';

\$settings['dbusername']='$user';

\$settings['dbpassword']='$pass'; 

\$settings['dbname']='$dbname';

\$settings['dbhost']='$host';

return \$settings;

	}

}

END;

       return $config;
   }
 
   function get_app($host,$theme,$install,$version,$id,$app,$start,$updated)
   {

$config = <<<END
<?php

 /*
 |--------------------------------------------------------------------------
 | Site Url
 |--------------------------------------------------------------------------
 |
 | Define site url to hundle all calls.
 | If you need to use this script in subfolder you can change it.
 | Sometimes this returns blank url, Please change it to your url if that happen.
 |
 */

 define('HOST','$host');

 /*
 |--------------------------------------------------------------------------
 | Site theme
 |--------------------------------------------------------------------------
 |
 | Choose themes provided in script.
 | For now we are providing only one theme (Main)
 |
 */

 define('Theme', '$theme');


 /*
 |--------------------------------------------------------------------------
 | App informations
 |--------------------------------------------------------------------------
 |
 | install => on //Already installed | install => off //Not installed.
 | app => our script name.
 | id => unique token for installtion //Don't change it!
 |
 */

  \$info = (object)

          [
      
           'install'=> '$install',
           
           'id'=> '$id',
           
           'app'=> '$app',
           
           'version'=> '$version',
           
           'start'=> '$start',
           
           'update'=> '$updated'
          ];
END;
       return $config;

   }