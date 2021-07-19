<?php

 if(file_exists(CONNECT.'system.class.php')){
  
  require_once ('system.class.php');

 /*
 |--------------------------------------------------------------------------
 | Dbh Class
 |--------------------------------------------------------------------------
 |
 | Here we get the connection to your database and use it for our query
 | For all our queries you can see queryModel.php in Models section
 |
 */
 
 class Dbh extends SystemComponent{
     
    private $servername;
    private $username;
    private $password;
    private $dbname;

    protected function connect(){

    $this->settings=parent::getSetting();
    $this->servername = $this->settings['dbhost'];
    $this->username = $this->settings['dbusername'];
    $this->password = $this->settings['dbpassword'];
    $this->dbname = $this->settings['dbname'];

    $conn = new mysqli($this->servername, $this->username, $this->password, $this->dbname);

	   if($conn->connect_errno)
		    
  		 die('Unable to connect to database [' . $conn->connect_error . ']');

     	$conn->set_charset('utf8');
		
         return $conn;
      }

  }
  
    define('DB_ERR',false);
    require_once (MODELS.'queryModel.php');

    }else{

    define('DB_ERR',true);
   }