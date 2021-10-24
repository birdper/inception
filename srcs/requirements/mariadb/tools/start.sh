#!/bin/sh

openrc default
rc-service mariadb setup
rc-service mariadb start

sed -i "s|.*\[mysqld\].*|\[mysqld\]\nskip-networking=false\nbind-address=0.0.0.0|g" /etc/my.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*skip-networking.*|skip-networking=false|g" /etc/my.cnf.d/mariadb-server.cnf

#mysql -e "CREATE DATABASE ${MYSQL_DATABASE} ;"
#mysql -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
#mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
#mysql -e "FLUSH PRIVILEGES;"


mysql -e "CREATE DATABASE wordpress_db ;"
mysql -e "CREATE USER 'admin'@'%' IDENTIFIED BY '1234';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress_db.* TO 'admin'@'%';"
mysql -e "FLUSH PRIVILEGES;"
#mysql ENTRYPOINT ["docker-entrypoint.sh"]${MYSQL_DATABASE} < wordpress.sql

rc-service mariadb stop

#mysqld_safe --datadir=/var/lib/mysql
