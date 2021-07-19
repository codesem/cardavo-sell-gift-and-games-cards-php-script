<?php

 /*
 |--------------------------------------------------------------------------
 | Configuration & Connection & Functions & Models
 |--------------------------------------------------------------------------
 |
 | Load config file getting info.
 | load database connector file.
 | Load our functions file.
 | Load our smarty model files.
 |
 */

 if(!file_exists(dirname(__DIR__).'/config/app.php')):
   require_once (dirname(__DIR__).'/config/models/configModel.php');
 else:
   require_once ('config.php');
 endif;
 
  require_once (CONNECT.'dbconnect.class.php');
  require_once (MODELS.'smartyModel.php');
  require_once (CONFIG.'function.php');
  require_once (MODELS.'requestModel.php');
  require_once (MODELS.'functionModel.php');
 
  $fun->do_host();

 //ON
 if($info->install == 'on'):
     
  $uid = $se->new_session('user','logged','uid');
  $result = pages();
  $smart->users($uid);
  $smart->sign_option();
  $smart->sign_user_fun();
  $fun->do_user($uid);
  $fun->do_lang(do_config(11));
  $fun->do_pages();
  $fun->do_protected_pages();
  $fun->do_cats();
  $fun->do_notifications();
  $fun->do_announcements(true);
  $fun->do_circle_stats();

 //OFF
 elseif($info->install == 'off'):
  $fun->do_install();
 endif;