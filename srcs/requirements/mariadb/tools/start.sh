#!/bin/sh

openrc default
rc-service mariadb setup

sed -i "s|.*\[mysqld\].*|\[mysqld\]\nskip-networking=false\nbind-address=0.0.0.0|g" /etc/my.cnf

sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*skip-networking.*|skip-networking=false|g" /etc/my.cnf.d/mariadb-server.cnf

rc-service mariadb start

mysql -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '1234' ;"
mysql -e "CREATE DATABASE $(MYSQL_DATABASE) ;"
mysql -e "GRANT ALL PRIVILEGES ON $(MYSQL_DATABASE).* TO 'admin'@'%' ;"
mysql -e "FLUSH PRIVILEGES ;"

mysql $(MYSQL_DATABASE) < /tmp/dump_wp_db.sql

mysql -e "SET PASSWORD for 'root'@'%' ='12345' ;"

rc-service mariadb stop
