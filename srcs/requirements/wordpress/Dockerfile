FROM alpine:3.14

COPY ./www.conf /conf.d

RUN apk update && apk upgrade\
     && apk add php7 php7-fpm mysql mysql-client wget

EXPOSE 9000

HEALTHCHECK

ENTRYPOINT ["php-fpm7"]
#ENTRYPOINT ["tail", "-f"]