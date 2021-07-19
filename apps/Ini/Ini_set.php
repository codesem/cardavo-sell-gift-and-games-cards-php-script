<?php

//uploads limits
ini_set('upload_max_filesize','40M');
ini_set('post_max_size','40M');

//memory limit
ini_set('memory_limit', '512M');

//max lifetime
ini_set("session.gc_maxlifetime", SESSION_TIME);
ini_set("session.cookie_lifetime", SESSION_TIME);