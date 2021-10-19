#!/bin/sh

sed -i "s|;listen.owner\s*=\s*nobody|listen.owner = ${PHP_FPM_USER}|g" ${PATH_PHP_FPM} \
&& sed -i "s|;listen.group\s*=\s*nobody|listen.group = ${PHP_FPM_GROUP}|g" ${PATH_PHP_FPM} \
&& sed -i "s|;listen.mode\s*=\s*0660|listen.mode = ${PHP_FPM_LISTEN_MODE}|g" ${PATH_PHP_FPM} \
&& sed -i "s|user\s*=\s*nobody|user = ${PHP_FPM_USER}|g" ${PATH_PHP_FPM} \
&& sed -i "s|group\s*=\s*nobody|group = ${PHP_FPM_GROUP}|g" ${PATH_PHP_FPM} \
&& sed -i "s|;log_level\s*=\s*notice|log_level = notice|g" ${PATH_PHP_FPM} \
&& sed -i 's/include\ \=\ \/etc\/php7\/fpm.d\/\*.conf/\;include\ \=\ \/etc\/php7\/fpm.d\/\*.conf/g' ${PATH_PHP_FPM}