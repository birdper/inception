
FROM alpine:3.12.3

LABEL maintainer="nbirdper@student.21-school.ru"
LABEL app="nginx"

ARG DOMAIN_NAME
ARG CERTS_CRT
ARG CERTS_KEY

RUN apk update && apk add nginx

RUN mkdir -p /run/nginx

RUN apk add openssl


RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-subj "/C=RU/ST=Republic Tatarstan/L=Kazan/O=21School/OU=21Kazan/CN=nbirdper" \
-keyout ${CERTS_KEY} \
-out ${CERTS_CRT};

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf


RUN sed -i "s/domain_name_here/${DOMAIN_NAME}/g" /etc/nginx/conf.d/default.conf 
RUN sed -i "s!certs_crt_here!'${CERTS_CRT}'!" /etc/nginx/conf.d/default.conf 
RUN sed -i "s!certs_key_here!'${CERTS_KEY}'!" /etc/nginx/conf.d/default.conf 

EXPOSE 80 443

ENTRYPOINT [ "nginx" ]

CMD  ["-g", "daemon off;"]
