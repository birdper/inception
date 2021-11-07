
FROM alpine:3.12.3

LABEL maintainer="nbirdper@student.21-school.ru"
LABEL app="wordpress"
LABEL app_version=${WORDPRESS_VERSION}
LABEL app_repository="https://wordpress.org/"

ARG WORDPRESS_VERSION=5.7.2
ARG PHP_VERSION=7

ARG WP_DB_HOST
ARG WP_DB_USER
ARG WP_DB_PASSWORD
ARG WP_DB_NAME
ARG WP_DEBUG

RUN apk update
RUN apk add openrc

RUN apk add php${PHP_VERSION} \
    php-fpm         \ 
    php-mysqli      \
    mariadb-client  \
    php-json        \
    php-mbstring    \
    php7-zlib

WORKDIR /var/www/html

RUN wget https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz

RUN tar -xzf wordpress-${WORDPRESS_VERSION}.tar.gz \
    && rm -rf wordpress-${WORDPRESS_VERSION}.tar.gz

RUN mkdir -p /run/php 

RUN sed -i "s/database_name_here/${WP_DB_NAME}/" ./wordpress/wp-config-sample.php \
    && sed -i "s/username_here/${WP_DB_USER}/" ./wordpress/wp-config-sample.php \
    && sed -i "s/password_here/${WP_DB_PASSWORD}/" ./wordpress/wp-config-sample.php \
    && sed -i "s/localhost/${WP_DB_HOST}/" ./wordpress/wp-config-sample.php \
    && sed -i "s/'WP_DEBUG', false/'WP_DEBUG', ${WP_DEBUG}/" ./wordpress/wp-config-sample.php \
    && mv ./wordpress/wp-config-sample.php ./wordpress/wp-config.php \
    && sed -i "s/127.0.0.1/wordpress/" /etc/php7/php-fpm.d/www.conf

EXPOSE 9000

CMD ["php-fpm7", "--nodaemonize"]
