

FROM alpine:3.12.3

LABEL maintainer="nbirdper@student.21-school.ru"
LABEL app="wordpress"
LABEL app_version=${WORDPRESS_VERSION}
LABEL app_repository="https://wordpress.org/"

ENV WORDPRESS_VERSION 5.7.2
ENV PHP_VERSION 7

RUN apk update
RUN apk add openrc

RUN apk add php${PHP_VERSION} php-fpm php-mysqli mariadb-client
#RUN apk add php${PHP_VERSION}-fpm \
#    php-mysqli \
#    php-pdo_mysql \
#    php-openssl \
#    php-pdo_odbc \
#    php-json \
#	php-pdo \
#    php-gettext \
#    php-iconv \
#    php-curl \
#    php-ctype \
#    php-session \
#    php-mbstring \
#	php-bz2 \
#    php-pdo_dblib \

WORKDIR /var/www

RUN wget https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz

RUN tar -xvzf wordpress-${WORDPRESS_VERSION}.tar.gz \
    && rm -rf wordpress-${WORDPRESS_VERSION}.tar.gz

COPY ./conf/wp-config.php /var/www/wordpress
#COPY ./conf/www.conf /etc/php7/php-fpm.d/

RUN mkdir -p /run/php

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT ["php-fpm7", "-F"]
#CMD php-fpm7 -F