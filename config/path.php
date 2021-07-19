<?php

if (!defined('DS')) {
    define('DS', DIRECTORY_SEPARATOR);
}

/**
 * The full path to the directory.
 */
define('ROOT', dirname(__DIR__));

/**
 * Path to the config directory.
 */
define('CONFIG', ROOT . DS . 'config' . DS);

/**
 * Path to the apps directory.
 */
define('APPS', ROOT . DS . 'apps' . DS);

/**
 * Path to the logs directory.
 */
define('LOGS', ROOT . DS . 'logs' . DS);

/**
 * Path to the logs directory.
 */
define('LOCALE', ROOT . DS . 'locale' . DS);

/**
 * Path to the smarty directory.
 */
define('SMARTY', ROOT . DS . 'config' . DS . 'smarty' . DS);

/**
 * Path to the models directory.
 */
define('MODELS', ROOT . DS . 'config' . DS . 'models' . DS);

/**
 * Path to the connector directory.
 */
define('CONNECT', ROOT . DS . 'config' . DS . 'connector' . DS);

/**
 * Path to the system directory.
 */
define('SYSTEM', ROOT . DS . 'config' . DS . 'system' . DS);

/**
 * Path to the ini directory.
 */
define('INI', ROOT . DS . 'apps' . DS . 'Ini' . DS);

/**
 * Path to the Mailer directory.
 */
define('MAILER', ROOT . DS . 'apps' . DS . 'Mailer' . DS);

/**
 * Path to the Theme directory.
 */
define('THEME', ROOT . DS . 'apps' . DS . 'Theme' . DS);

/**
 * Path to the installer data directory.
 */
define('DATA', ROOT . DS . 'webroot' . DS . 'installer' . DS . 'data' . DS);

/**
 * Path to the Coinbase directory.
 */
define('CBS', ROOT . DS . 'apps' . DS . 'Cbs' . DS);

/**
 * Path to the PayPal directory.
 */
define('PPL', ROOT . DS . 'apps' . DS . 'Ppl' . DS);

/**
 * Path to the Stripe directory.
 */
define('STP', ROOT . DS . 'apps' . DS . 'Stp' . DS);

/**
 *
 * Path to the webroot directory.
 */
define('WWW_ROOT', ROOT . DS . 'webroot' . DS);
