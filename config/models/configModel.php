<?php

 /*
 |--------------------------------------------------------------------------
 | configModel
 |--------------------------------------------------------------------------
 |
 | This is a default config when we need to install first time.
 |
 */

 require_once(dirname(__DIR__).DIRECTORY_SEPARATOR.'path.php');

 //define parm
 
 define('debug',false);
 define('PFX','ca_');
 define('HOST','');
 define('Theme', 'main');
 define('SESSION_TIME','3600');
 define('TimeZone', 'UTC');
 define('Format', "d M Y");
 define('Now',time());
 define('Year',date("Y"));

 $dateTime = new DateTime('now', new DateTimeZone(TimeZone));
 $dateForm = $dateTime->format(Format);

 define('FILE',basename(basename($_SERVER['SCRIPT_FILENAME'])));
 define('ACCESS',$_SERVER['REQUEST_URI']);
 define('INSTALL_FILE',DS.'installer'.DS.'index');
 define('LICENSE_FILE',DS.'installer'.DS.'license');
 define('DATABASE_FILE',DS.'installer'.DS.'database');
 define('BUILD_FILE',DS.'installer'.DS.'build');
 define('ADMIN_FILE',DS.'installer'.DS.'admin');
 
 //required_files
 
 require_once (MODELS.'sessionModel.php');
 require_once (MODELS.'dataModel.php');
 require_once (SMARTY.'Smarty.class.php');
 require_once (INI.'Errors.php');

 //app info
 
 $info = (object)

        [
      
        'install'=> 'off',
        'app'=> 'CARDAVO',

         ];
          
 //smarty
 
 $smarty = new Smarty;
 $smarty->debugging = false;
 $smarty->caching = false;
 $smarty->cache_lifetime = 120;