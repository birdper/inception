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
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress_db') );

/** MySQL database username */
define( 'DB_USER', ('admin') );

/** MySQL database password */
define( 'DB_PASSWORD', ('1234') );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '25 uZ7I<urj:68^6BdM-Wf2b:GyOlQ.z%(wbFr?mL91=0zG2Zr)LU7AX},2R&K2U');
define('SECURE_AUTH_KEY',  '^jA9-]Q]Z^v_{<0{^]ED0]xB}xzDV0_ql]r)>+({me9:5RG%-3|IN4p{#jymL-[p');
define('LOGGED_IN_KEY',    'ps;ya^F^Ah=i;ga!cmBd;-,B39SN~`OhTa0/7 Tx$bf~TY@)-xun.3{{L)}&gyM~');
define('NONCE_KEY',        '|K8XQmv*X~_NvsE)nt#_lPIf#|9n{a&!u2yMGpAE//rC$8@}oaQ@&Ud?8.ymA[Y-');
define('AUTH_SALT',        '{>-+00-HI>?Gi#6IcKC6C`/C3dw(@w7&md)za5q[T`|LpG?_IFwHqwC|:>;Q(,y<');
define('SECURE_AUTH_SALT', '7`51} #}gbdx{!(BOkMv}IdJ2!5Q.|^(kRFKi)bC-NnaAOR/78W/]<*qCq&S0gJq');
define('LOGGED_IN_SALT',   '%A<%-nS5X&p]]PnP}m[tGDXW15,G>;d w/ XfNM&*Bj5E(|v.)oB!Q)jP%ns2C9p');
define('NONCE_SALT',       '}ZJL!kWOS9!QFK:hc[#+stOzCSE7gmGe7CM{0:LoQGB5_FSW]jD=Y%Y$gMv[mDD-');

/**#@-*/

/**
 * WordPress Database Table prefix.
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
define( 'WP_DEBUG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
