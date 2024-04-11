<?php
define( 'DB_NAME', getenv('WORDPRESS_DB_NAME') );
define( 'DB_USER', getenv('WORDPRESS_DB_USER') );
define( 'DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD') );
define( 'DB_HOST', getenv('WORDPRESS_DB_HOST') );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

define('AUTH_KEY',         'LR3oFrMo-{9-u3e-1E>B~/hs#SFxfqXXhFgyIU\$&sf\$-q:y9Bq.w}t^\$)5c.e2X:');
define('SECURE_AUTH_KEY',  'zW;v1[`*N{wIG0y]B;z-|b|g=x7a[b0SDE|rrF-Hi)&#+.;xm5fJT=mk:#ylC-B=');
define('LOGGED_IN_KEY',    '>x.ZL3+S}+;tB`|~w}!_cpP|j(XFV~emOlj,}f]J+EAQyZJ9IaM9ti16;F2T`%G!');
define('NONCE_KEY',        'r7fJ2@lyhgm2Ud+#LI%{:X7/XcxE3-/KJwhtqEv0&Lx_1TbE3T=)hu;*:?~htt3%');
define('AUTH_SALT',        '^`|4njwq@WT)+bk~Irj|K4WbNHAr9>@|-R95=2I-=rz[f6l8;%|DsQUYXp:@{q!2');
define('SECURE_AUTH_SALT', 'q7!e]yiEG{;=tCX4ys;B([sw]c;q2--8|Zqe4/-PlHl&O9G7Cl\$ik`_KwKv=Q|1');
define('LOGGED_IN_SALT',   'Nr{y0whK+(H1zZ8]B.tZ9Fu?a47[\$]_2~QAnCh[.]~Du|3OhI7/sYs%|9mcC?^(`');
define('NONCE_SALT',       '~ENg.]FYPJSqG@DT%|2^4.F_rV@xMQ%J6M-n>&V&x|(wq9F\$ZeQ^<sv+VFft|r`]');

$table_prefix = 'wp_';

define( 'WP_DEBUG', true );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';