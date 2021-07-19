<?php
 function _is_curl_installed() {
     //check for curl extension
    if  (in_array  ('curl', get_loaded_extensions())) {
        return true;
    }
    else {
        return false;
    }
 }
 function sitePRCL() {
    $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
    return $protocol;
 }
 function pages($perpage = 9,$screen = 0){
   if (!isset($_GET['p']) || $_GET['p']==0 )
    $screen;
   else
    $screen=$_GET['p']-1;
    $start = $screen * $perpage;
    return array('perpage' => $perpage, 'screen' => $screen , 'start' => $start);
 }
 function paging($page,$last_page,$part,$custom=false){
 global $smarty;

 $paging = false;
 
 if(contains(ACCESS, '/admin/')){
  $l='<li>';
  $li='</li>';
  $class="";
 }else{
   $l='<li class="page-item">';
   $active='<li class="page-item act">';
   $li='</li>';
   $class="page-link";
 }
 
 if($page != 1){
 $paging.=$l.'<a class="'.$class.'" href="'.$part.($page - 1).'">&lsaquo;</a>'.$li;
 }
 if($page > 4){
 $paging.=$l.'<a class="'.$class.'" href="'.$part.($page-$page+1).'">&laquo;</a>'.$li;
 }
 for($i=4;$i>0;$i--)
 if($page-$i>0){
 $paging.=$l.'<a class="'.$class.'" href="'.$part.($page-$i).'">'.($page-$i).'</a>'.$li;
 }
 if ($page == 0){
 $paging.=$l.'<a class="'.$class.'">&rsaquo;</a>'.$li;
 }
 elseif($page == $last_page){
 $paging.=$active.'<a class="'.$class.'">&lsaquo;</a>'.$li;
 }
 else{
 $paging.=$l.'<a class="'.$class.'">'.$page.'</a>'.$li;
 }
 for($i=1 ; $i<5 ; $i++)
 if($last_page-($page+$i)>0){
 $paging.=$l.'<a class="'.$class.'" href="'.$part.($page+$i).'">'.($page+$i).'</a>'.$li;
 }
 if ($page < $last_page - 5){
 $paging.=$l.'<a class="'.$class.'" href="'.$part.($last_page - 1).'">&raquo;</a>'.$li;
 }
 if ($page != $last_page-1){
 $paging.=$l.'<a class="'.$class.'" href="'.$part.($page + 1).'">&rsaquo;</a>'.$li;
 }
 if($paging && !$custom){
     $smarty->assign('paging',$paging);
 }
 if($paging && $custom){
     return $paging;
 }
  
 }
 function redirect($result, $permanent = false) {
     global $hs,$HOST;
     
     /* Redirecting */
     if($permanent) {
         header('HTTP/1.1 301 Moved Permanently');
     }
     if (empty($result['controller']) && isset($result['action'])) {
         header('Location: '.$HOST.$result['action']);
	 } elseif (isset($result['action'])) {
	     header('Location: '.$HOST.$result['controller'].DS.$result['action']);
	 }
     exit();
}
 function delete_files($target) {
     
     /* Delete Files */
    if(is_dir($target)){
        $files = glob( $target . '*', GLOB_MARK ); //GLOB_MARK adds a slash to directories returned
        foreach( $files as $file ){ 
            delete_files( $file );      
        }
        rmdir( $target );
    } elseif(is_file($target)) {
        unlink( $target );  
    }
 }
 function fetch($path = ''){
     global $smarty;
     
     /* Template */
     $temp = $smarty->fetch(WWW_ROOT . 'template'.DS . Theme . DS . $path . '.tpl');
     return $temp;
 }
 function labels($r,$i,$d=false){
     global $smarty;
     
     if(!$d):
         $smarty->assign('_'.$r,$i);
     else:
         $smarty->assign('_'.$r,$i);
         $smarty->assign('__'.$r,$d);
     endif;
 }
 function messages($r,$i,$d=false){
     global $smarty;
     
     $smarty->assign('_'.$r,$i);
     if($i=='danger' || $i=='warnings'):
         $smarty->assign('__'.$r,'Error: '.$d);
     else:
         $smarty->assign('__'.$r,$d);
     endif;
 }
 function secure_role(){ 
 global $user,$uid;

 if( empty(trim($uid)) || $uid == '0') {
  //user is not logged in
  redirect(['action' => 'signin?r='.base64_encode(ACCESS)]);
 }

 if( !isset($_SESSION['user']['logged'])) {
  //user is not logged in
  redirect(['action' => 'signin?r='.base64_encode(ACCESS)]);
 }

  if(contains(ACCESS, '/admin/') && $user->role == 'user') {
   //check for roles 
   redirect(['controller' => 'user', 'action' => $user->username.'/']);
  }
 }
 function mailer($mailer,$debug=false){
 
 //mailer
 require_once (MAILER.'PHPMailer.php');
 require_once (MAILER.'POP3.php');
 require_once (MAILER.'OAuth.php');
 require_once (MAILER.'SMTP.php');
 $mailAPP = new PHPMailer;
 
 switch(do_config(35)):
  case 'smtp':
  //use smtp
  $mailAPP->isSMTP();
 if($debug){
  $mailAPP->SMTPDebug = 1;
 }
  $mailAPP->Host = do_config(37);
  $mailAPP->Port = do_config(38);
  $mailAPP->SMTPSecure = do_config(39);
  $mailAPP->SMTPAuth = true;
  $mailAPP->Username = do_config(36);
  $mailAPP->Password = do_config(40);
  break;
 endswitch;

  $mailAPP->setFrom($mailer['from'], do_config(0));
  $mailAPP->addReplyTo($mailer['from'], do_config(0));
  $mailAPP->addAddress($mailer['to'], $mailer['subject']);
  $mailAPP->Subject = $mailer['subject'];
  $mailAPP->isHTML(true); 
  $mailAPP->msgHTML($mailer['msg']);
  $response = $mailAPP->send();
  if(!$response){
     if($debug){
         var_export($mailAPP->ErrorInfo);exit;
     }else {
         return 2;
     }
  }
}
 function reCaptcha($reCAPTCHA_secret_key=false){
     
 //recaptcha
 //var_export(do_config(5));exit;
 if(isset($_POST['g-recaptcha-response'])):
  $info = [
  'secret' => do_config(5),
  'response' => $_POST['g-recaptcha-response']];
  
  $verify = curl_init();
 
  curl_setopt($verify, CURLOPT_URL, "https://www.google.com/recaptcha/api/siteverify");
  curl_setopt($verify, CURLOPT_POST, true);
  curl_setopt($verify, CURLOPT_POSTFIELDS, http_build_query($info));
  curl_setopt($verify, CURLOPT_SSL_VERIFYPEER, false);
  curl_setopt($verify, CURLOPT_RETURNTRANSFER, true);
  $response = curl_exec($verify);
  $data = json_decode($response);

  if(isset($data->success) && $data->success == true){
    return true;
  }elseif($data->error-codes || $data->challenge_ts || $data->hostname || $data->success == false){
    return false;
  }
 
 endif;

 }
 function check_request($result,$func=false,$mode=false){

 //check for inputs requests

 if(!empty($result)){
    
  if(!$mode):

   if ($func):
      
    $result = filter_var($func($_POST[$result]), FILTER_SANITIZE_STRING);

   else:

    $result = filter_var($_POST[$result], FILTER_SANITIZE_STRING);
    
   endif;
   
       return $result;
       
    if(empty($result) || !filter_var($result, FILTER_SANITIZE_STRING)):
     
       return false;

     endif;

   elseif($mode):

   switch($mode):
     
   case 'email':

   if ($func):
      
    $result = filter_var($func($_POST[$result]), FILTER_VALIDATE_EMAIL);

   else:

    $result = filter_var($_POST[$result], FILTER_VALIDATE_EMAIL);
    
   endif;

       return $result;

    if(empty($result) || !filter_var($result, FILTER_VALIDATE_EMAIL)):
     
       return false;
       
     endif;
     
  break;
  
  case 'int':
      
   if ($func):
      
    $result = filter_var($func($_POST[$result]), FILTER_VALIDATE_INT);

   else:

    $result = filter_var($_POST[$result], FILTER_VALIDATE_INT);
    
   endif;

       return $result;

    if(empty($result) || !filter_var($result, FILTER_VALIDATE_INT)):
     
       return false;
       
     endif;
 
  break;
  
  case 'ip':
      
   if ($func):
      
    $result = filter_var($func($_POST[$result]), FILTER_VALIDATE_IP);

   else:

    $result = filter_var($_POST[$result], FILTER_VALIDATE_IP);
    
   endif;

       return $result;

    if(empty($result) || !filter_var($result, FILTER_VALIDATE_IP)):
     
       return false;
       
     endif;
 
  break;
  
  case 'url':
      
   if ($func):
      
    $result = filter_var($func($_POST[$result]), FILTER_VALIDATE_URL);

   else:

    $result = filter_var($_POST[$result], FILTER_VALIDATE_URL);
    
   endif;

       return $result;

    if(empty($result) || !filter_var($result, FILTER_VALIDATE_URL)):
     
       return false;
       
     endif;
 
  break;
 
  endswitch;
     
  endif;
  
 }
 }
 function get_percentage($amount,$percent) {
    $total = do_amount($amount,false);
    $tax = do_amount(($percent / 100) * $total, false);
    return $tax;
 }
 function show($path = ''){
  global $smarty;
  
   //display - smarty 
   if(isset($path)){
    $smarty->display(WWW_ROOT . 'template/' . Theme . DS . $path . '.tpl');
   }
  }
 function errorAndDie($error_msg) {
 global $dateForm;

  //check for errors write in => logs => reports.txt
  $debug_file = ROOT.DS.'logs/reports.txt';
  if (!empty($debug_file)) {
   $report = 'Error: '.$dateForm.' | '.$error_msg.PHP_EOL; 
   write($debug_file,$report,"a");
   die('Error: '.$error_msg);
  }
 }
 function alerts($session,$alert){
 global $smarty;

   //alerts
  if(isset($_SESSION[$session][$alert])){
    $smarty->assign($alert,true);
    unset($_SESSION[$session]);
  } else {
    $smarty->assign($alert,false);
  }
 }
 function do_array_price($array){
     
     $array = explode(',',$array);
     $count = count($array)-1;
     $price = $array[0].','.$array[$count];
     return $price;
 }
 function do_amount($a,$r=true){
      if($r) {
         if(do_config(14) == 'before') {
          return do_config(2).number_format($a, do_config(15), '.', '');
         }elseif(do_config(14) == 'after') {
          return number_format($a, do_config(15), '.', '').do_config(2);
         }
      } else {
          return number_format($a, do_config(15), '.', '');
      }  
 }
 function do_config($i){
     global $query;
     $id=$i+1;
     $option = $query->addquery('select','config','value','i', $id,'config_id=?');
     return $option->value;

 }
 function get_ip() {
 // Get client IP address
    if (getenv("HTTP_CF_CONNECTING_IP")) {
        $ip = getenv("HTTP_CF_CONNECTING_IP");
    } elseif (getenv("HTTP_CLIENT_IP")) {
        $ip = getenv("HTTP_CLIENT_IP");
    } elseif (getenv("HTTP_X_FORWARDED_FOR")) {
        $ip = getenv("HTTP_X_FORWARDED_FOR");
        if (strstr($ip, ',')) {
            $tmp = explode(',', $ip);
            $ip = trim($tmp[0]);
        }
    } else {
        $ip = getenv("REMOTE_ADDR");
    }

    return $ip;
 }
 function app_version(){
     
    // App Version
	$ch = curl_init('https://codsem.com/midfaucet/server/update?v=new');
		  curl_setopt($ch, CURLOPT_FAILONERROR, TRUE);
		  curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
		  curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
          curl_setopt($ch,CURLOPT_TIMEOUT,3);
	$data = curl_exec($ch);   
	if ($data !== FALSE) {
		if (PHP_INT_SIZE < 8 && version_compare(PHP_VERSION, '5.4.0') >= 0) {
			// We are on 32-bit PHP, so use the bigint as string option.
			$dec = json_decode($data, TRUE, 512, JSON_BIGINT_AS_STRING);
		} else {
			$dec = json_decode($data, TRUE);
			}
			if ($dec !== NULL && count($dec)) {
				return $dec;
			} else {
				// If you are using PHP 5.5.0 or higher you can use json_last_error_msg() for a better error message
				return array('error' => 'Unable to parse JSON result ('.json_last_error().')');
			}
		} else {
			return array('error' => 'cURL error: '.curl_error($ch));
		}

 }
 function nastyhosts($ip){
 
    // NastyHosts
	$ch = curl_init('http://v1.nastyhosts.com/'.$ip);
		  curl_setopt($ch, CURLOPT_FAILONERROR, TRUE);
		  curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
		  curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
          curl_setopt($ch,CURLOPT_TIMEOUT,3);
	$data = curl_exec($ch);   
	if ($data !== FALSE) {
		if (PHP_INT_SIZE < 8 && version_compare(PHP_VERSION, '5.4.0') >= 0) {
			// We are on 32-bit PHP, so use the bigint as string option.
			$dec = json_decode($data, TRUE, 512, JSON_BIGINT_AS_STRING);
		} else {
			$dec = json_decode($data, TRUE);
			}
			if ($dec !== NULL && count($dec)) {
			    if($dec["suggestion"] == 'deny') {
                   return true;
                } elseif($dec["suggestion"] == 'allow') {
                   return false;
                } else {
                   return false;
                }
			} else {
				return false;
			}
		} else {
			return false;
		}
       
 }