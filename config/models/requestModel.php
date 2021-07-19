<?php

 /*
 |--------------------------------------------------------------------------
 | requestModel
 |--------------------------------------------------------------------------
 |
 | Get Cross-site request forgery token (CSRF).
 |
 */
 
 class Request{

	public function csrf_token() {

		if(isset($_SESSION['csrfToken'])) 
			return $_SESSION['csrfToken']; 
		else{
			$token = bin2hex(openssl_random_pseudo_bytes(32));
			$_SESSION['csrfToken'] = $token;
			return $token;
		}

	}
    public function site_protocol(){

    // URL
    $protocol = isset($_SERVER['HTTPS']) && ($_SERVER['HTTPS'] === 'on' || $_SERVER['HTTPS'] === 1) || isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https' ? 'https' : 'http';
    return $protocol;
  }
    public function site_url(){
        return $this->site_protocol() . '://' . $_SERVER['HTTP_HOST'] . DS ;
    }
 }
 $sr = new Request;
 $smarty->assign('csrfToken',$sr->csrf_token());