

FROM alpine:3.12.3

LABEL maintainer="nbirdper@student.21-school.ru"
LABEL app="wordpress"
LABEL app_version=${WORDPRESS_VERSION}
LABEL app_repository="https://wordpress.org/"

ENV WORDPRESS_VERSION 5.7.2
ENV PHP_VERSION 7

RUN apk update
RUN apk add openrc

RUN apk add php${PHP_VERSION} php-fpm php-mysqli mariadb-client \
    php-json \
    php-mbstring \
    php7-zlib

#RUN apk add php${PHP_VERSION}-fpm \
#    php-mysqli \
#    php-pdo_mysql \
#    php-openssl \
#    php-pdo_odbc \
#	 php-pdo \
#    php-gettext \
#    php-iconv \
#    php-curl \
#    php-ctype \
#    php-session \
#	php-bz2 \
#    php-pdo_dblib \

WORKDIR /var/www/html

RUN wget https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz


RUN tar -xzf wordpress-${WORDPRESS_VERSION}.tar.gz \
    && rm -rf wordpress-${WORDPRESS_VERSION}.tar.gz


# COPY ./conf/wp-config.sh /tmp/

RUN mkdir -p /run/php 
    # && chmod +x /tmp/wp-config.sh

# RUN /tmp/wp-config.sh

RUN sed -i "s/'WP_DEBUG', false/'WP_DEBUG', 'true'/" ./wordpress/wp-config-sample.php
#
RUN sed -i "s/database_name_here/wordpress_db/" ./wordpress/wp-config-sample.php
RUN sed -i "s/username_here/admin/" ./wordpress/wp-config-sample.php
RUN sed -i "s/password_here/1234/" ./wordpress/wp-config-sample.php
RUN sed -i "s/localhost/mariadb/" ./wordpress/wp-config-sample.php && mv ./wordpress/wp-config-sample.php ./wordpress/wp-config.php
#
RUN sed -i "s/127.0.0.1/wordpress/" /etc/php7/php-fpm.d/www.conf

EXPOSE 9000

#ENTRYPOINT ["php-fpm7", "-F"]
CMD ["php-fpm7", "--nodaemonize"]