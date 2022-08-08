<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpressdb' );

/** Database username */
define( 'DB_USER', 'acollin' );

/** Database password */
define( 'DB_PASSWORD', '1234' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '8,ITvuG_nx>&DP=tu9kh^X#1i0OR>2^oQ)=8d~|-D:-#S]|nPM=hTxPP1mI+:N-_');
define('SECURE_AUTH_KEY',  '~knG74qfd%iMFht 3z~@6=(iDN]Ygp1{2z|%)nh|m59tt+(+bmFud+DVzP ]0-h9');
define('LOGGED_IN_KEY',    'rH Z5xS%y=Sl-@j:$#6J^%~USJ)|&nTMY-w4uobAbg~Qed&zrUB+l[WdSJgQ 3x;');
define('NONCE_KEY',        '@_L-U+K+-=cJmgT8(_y6k6X|^:j]jzThYjw)78j)0{KzNQrf2!1wo?^uPek+-_#6');
define('AUTH_SALT',        'pNLEv6OHYQHBpDY~AhI<k2XN&N=2veFsc{t+.CYLiI-uw+ByD?2n]=fJvUtT<yN;');
define('SECURE_AUTH_SALT', '[Gdjz{aU4.5m1C{ q{AGQ_2Ic<~E4Kkq;?((:m^_3#T];!7%-N_u 7|j]YIx+)8G');
define('LOGGED_IN_SALT',   'k|(Z|m7ayU x+S]<y{qa;Di8Z+`s<)g)K|+:+i;a2nP6`Y/#kz]i|]NAC_.{dd//');
define('NONCE_SALT',       'moRv[_3|T1u+Io[#x$ONk>9W J2p6n<.b{`wLh?2*}6UGAC<s`+bM?E|9&W7iMvB');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */


/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', '/var/www/html/wordpress' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
