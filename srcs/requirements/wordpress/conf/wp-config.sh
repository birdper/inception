#!/bin/sh

#sed -i "s/'WP_DEBUG', false/'WP_DEBUG', 'true'/" ./wordpress/wp-config-sample.php

sed -i "s/database_name_here/wordpress_db/"  /var/www/html/wordpress/wp-config-sample.php
sed -i "s/username_here/${MYSQL_USER}/"  /var/www/html/wordpress/wp-config-sample.php
sed -i "s/password_here/${MYSQL_PASSWORD}/"  /var/www/html/wordpress/wp-config-sample.php
sed -i "s/localhost/${DB_HOST}/"  /var/www/html/wordpress/wp-config-sample.php

sed -i "s/127.0.0.1/wordpress/" /etc/php7/php-fpm.d/www.conf

#mv  /var/www/html/wordpress/wp-config-sample.php  /var/www/html/wordpress/wp-config.php
