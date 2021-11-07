FROM    debian:buster

RUN     apt-get update \
        && apt-get install -y mariadb-server

ARG     MYSQL_DATABASE
ARG     MYSQL_USER
ARG     MYSQL_PASSWORD
ARG     MYSQL_ROOT_PASSWORD

COPY    /conf/wordpress.sql /wordpress.sql
COPY    /tools/setup.sh /tmp/setup.sh
RUN     chmod +x /tmp/setup.sh

COPY    /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN     /tmp/setup.sh

CMD     [ "mysqld", "-u", "root" ]
