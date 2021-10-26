#!/bin/sh

#sed -i "s/'WP_DEBUG', false/'WP_DEBUG', 'true'/" ./wordpress/wp-config-sample.php

sed -i "s/database_name_here/${MYSQL_DATABASE}/" ./wordpress/wp-config-sample.php
sed -i "s/username_here/${MYSQL_USER}/" ./wordpress/wp-config-sample.php
sed -i "s/password_here/${MYSQL_PASSWORD}/" ./wordpress/wp-config-sample.php
sed -i "s/localhost/${DB_HOST}/" ./wordpress/wp-config-sample.php

sed -i "s/127.0.0.1/wordpress/" /etc/php7/php-fpm.d/www.conf

mv ./wordpress/wp-config-sample.php ./wordpress/wp-config.php
