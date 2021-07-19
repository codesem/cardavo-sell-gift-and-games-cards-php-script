<?php
/*
	Coinbase API Class
	Latest Version - 2018-03-22
*/

class CoinbaseAPI {
	private $private_key = "";
	private $ch = null;
	
	public function Setup($private_key) {
		$this->private_key = $private_key;
		$this->ch = null;
	}
	
	/**
	 * Creates a basic transaction with minimal parameters.<br />
	 * See CreateTransaction for more advanced features.
	 * @param amount The amount of the transaction (floating point to 8 decimals).
	 * @param currency1 The source currency (ie. USD), this is used to calculate the exchange rate for you.
	 * @param currency2 The cryptocurrency of the transaction. currency1 and currency2 can be the same if you don't want any exchange rate conversion.
	 * @param address Optionally set the payout address of the transaction. If address is empty then it will follow your payout settings for that coin.
	 * @param ipn_url Optionally set an IPN handler to receive notices about this transaction. If ipn_url is empty then it will use the default IPN URL in your account.
	 * @param buyer_email Optionally (recommended) set the buyer's email so they can automatically claim refunds if there is an issue with their payment.
	 */
	public function CreateTransactionSimple($amount, $currency1, $currency2, $address='', $ipn_url='', $buyer_email='') {		
		$req = array(
			'amount' => $amount,
			'currency1' => $currency1,
			'currency2' => $currency2,
			'address' => $address,
			'ipn_url' => $ipn_url,
			'buyer_email' => $buyer_email,
		);
		return $this->api_call('create_transaction', $req);
	}

	public function CreateTransaction($req) {
		// See https://commerce.coinbase.com/docs/api/ for parameters
		return $this->api_call('https://api.commerce.coinbase.com/charges', $req);
	}
	private function is_setup() {
		return (!empty($this->private_key));
	}
	
	private function api_call($cmd, $req = array()) {
		if (!$this->is_setup()) {
			return array('error' => 'You have not called the Setup function with your private and public keys!');
		}
		
		// Set the API command and required fields
        $res['version'] = "2018-03-22";
		$res['key'] = $this->private_key;

		// Generate the query string
		$post_data = http_build_query($req, '', '&');
	    
		// Input HTTP HEADER data
		$head_data = array('X-CC-Api-Key: '.$res['key'], 'X-CC-Version: '.$res['version']);
	    
		// Create cURL handle and initialize (if needed)
		if ($this->ch === null) {
			$this->ch = curl_init($cmd);
            curl_setopt($this->ch, CURLOPT_POST, TRUE);
			curl_setopt($this->ch, CURLOPT_FAILONERROR, TRUE);
			curl_setopt($this->ch, CURLOPT_RETURNTRANSFER, TRUE);
			curl_setopt($this->ch, CURLOPT_SSL_VERIFYPEER, 0);
		}
		curl_setopt($this->ch, CURLOPT_HTTPHEADER, $head_data);
		curl_setopt($this->ch, CURLOPT_POSTFIELDS, $post_data);
	    
		$data = curl_exec($this->ch);  

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
			return array('error' => 'cURL error: '.curl_error($this->ch));
		}
	}
};