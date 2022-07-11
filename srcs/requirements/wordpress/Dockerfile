FROM alpine:3.14

WORKDIR /usr/src/wordpress

RUN apk update && apk upgrade \
     && apk add --no-cache bash vim php7-openssl php7 php7-fpm php-mysqli mariadb-client wget curl && \
    rm -rf /var/cache/apk/*

EXPOSE 9000

COPY ./www.conf /etc/php/7.4/fpm/pool.d

COPY ./tools/start.sh ./var/www/wordpress


ENTRYPOINT ["php-fpm7"]