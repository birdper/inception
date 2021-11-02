
FROM alpine:3.12.3

LABEL maintainer="nbirdper@student.21-school.ru"
LABEL app="mariadb"

RUN apk update

RUN apk add mariadb mariadb-client openrc

RUN mkdir -p /run/openrc && touch /run/openrc/softlevel

COPY ./databases/dump_wp_db.sql /tmp/dump_wp_db.sql
COPY ./tools/start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh
RUN /tmp/start.sh

CMD ["mysqld_safe", "--datadir=/var/lib/mysql"]
