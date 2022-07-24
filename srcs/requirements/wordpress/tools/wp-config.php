<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */
 
// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpressdb');
 
/** MySQL database username */
define('DB_USER', 'acollin');
 
/** MySQL database password */
define('DB_PASSWORD', '123');
 
/** MySQL hostname */
define('DB_HOST', 'localhost:3306');
 
/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');
 
/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');
 
/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'cboV-K-+mr2rrdUY+hbh[3+cGB2Ui9`3mmI6YK@tl7X_j7J=-ngfmy*uua`,p-~O');
define('SECURE_AUTH_KEY',  '|mw,+yc|XEgSp(7O)SW_Gdt;+G|&K;=N?1J=p2`H_I4,<5IMMMY(I_kI16yKG9M7');
define('LOGGED_IN_KEY',    'IM-zX_nANPSM>*And&a!mBh0%AaIi:+C+cmE:,a|y;]cl>#7ytAl $<f6&;TK-~<');
define('NONCE_KEY',        '+e<g+b)z2b.|=H?RPs>1>?P!y{$:N MFOaNPE#(M#K?l}iJ?A*V}o?+5atheV66(');
define('AUTH_SALT',        '?T#I1N~!i+O&xuMC,-BW aL.xnkq:%^=1o+l}KACbVzb}p@QRKgoeEMYT5u:[ABF');
define('SECURE_AUTH_SALT', '0Q?OuY+(/0S8z`99 ;^Q|86w_SA4hT:K9$|k;R@xstxj-:qdwQ-%/vlBVFzTCKh|');
define('LOGGED_IN_SALT',   '4YN |&=|[-SD8tl8b^:>zyw!zO8K8QVsGD1hLhAdm^6o47]j3:[w-jXQWyzE )NG');
define('NONCE_SALT',       'MS<ZiJR!yo+O=mWxaxx+kSH/$EOC!7V~EyV~4^y@^|-TMGp^[D,mbu5O>GdqjwJ#');
 
/**#@-*/
 
/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';
 
/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);
 
/* That's all, stop editing! Happy blogging. */
 
/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');
 
/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');