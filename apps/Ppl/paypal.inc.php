<?php
/*
	PayPal Express Checkout Class
	Latest Class Version - 1.0.0
*/

class PayPalAPP {
	private $random_key = "";
	private $curr = "USD";
	
	public function Setup($random_key) {
		$this->random_key = $random_key;
		$this->curr = "USD";
	}

	public function ExpressCheckout($req) {
		// See https://developer.paypal.com/docs/checkout/
		return $this->ppl_call('call_checkout', $req);
	}
	private function is_setup() {
		return (!empty($this->random_key));
	}
	
	private function ppl_call($cmd, $req = array()) {
		if (!$this->is_setup()) {
			return array('error' => 'You have not called the Setup function with a random key!');
		}
		
		// Set the call command and required fields
		$req['custom'] = $this->random_key;
        $req['currency'] = $this->curr;

		// Generate the query string
		$ppl_url = "https://www.paypal.com/cgi-bin/webscr?";
		$post_data = http_build_query($req, '', '&');
	    
	    switch($cmd){
	       case 'call_checkout':
			   return array('hosted_url' => $ppl_url.$post_data);
	           break;
	       default:
			   return array('error' => 'wrong/empty command call!');
	           break;
	    }
	}
};