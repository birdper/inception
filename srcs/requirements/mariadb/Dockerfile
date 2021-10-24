
FROM alpine:3.12.3

LABEL maintainer="nbirdper@student.21-school.ru"
LABEL app="mariadb"

RUN apk update && mkdir -p /run/openrc

RUN apk add mariadb mariadb-client openrc \
    && touch /run/openrc/softlevel

COPY ./tools/start.sh /docker-entrypoint-initdb.d/
RUN /docker-entrypoint-initdb.d/start.sh

CMD ["mysqld_safe"]
#"--datadir=/var/lib/mysql"

#CMD ["--datadir=/var/lib/mysql"]

