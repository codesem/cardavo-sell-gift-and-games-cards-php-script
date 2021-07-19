<?php

 /*
 |--------------------------------------------------------------------------
 | sessionModel
 |--------------------------------------------------------------------------
 |
 | Session setup/activate/delete permission can be found here.
 |
 */
 
  session_name('CARDAVO');
  session_start();
  ob_start();

  class session{
   public function new_session($name,$action1=false,$action2=false,$true=false) {

    if ($action1 && $action2) {
     if(isset($_SESSION[$name][$action1])) {
       $result = $_SESSION[$name][$action2];
       return $result;
      }
     }
  
  if ($action1 && !$action2) {
     if(isset($_SESSION[$name][$action1])) {
      $result=$_SESSION[$name][$action1];
      return $result;
    }
   } elseif($true) {
     if(isset($_SESSION[$name][$action1])) {
      $_SESSION[$name][$action1]=true;
     }
    }
   }
   public function check_se($name,$action,$remove=false) {
  
     if(isset($_SESSION[$name][$action])) {
       return true;
     if ($remove)
       unset($_SESSION[$name][$action]);
  } else
    return false;
  }
   }
  $se = new session;