FROM alpine:3.14

WORKDIR /usr/src/wordpress

COPY ./www.conf /conf.d

RUN apk update && apk upgrade\
     && apk add php7 php7-fpm mariadb-client wget

EXPOSE 9000

ENTRYPOINT ["php-fpm7"]