#!/bin/sh

openrc default

#rc-service php-fpm start
rc-update add php-fpm default
#php-fpm7 -F

