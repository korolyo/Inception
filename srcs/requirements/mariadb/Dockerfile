FROM alpine:3.14

RUN apk update && apk add --no-cache mariadb mariadb-client mariadb-server-utils openrc && \
    rm -f /var/cache/apk/*

EXPOSE 3306

ADD conf/50-server.cnf /etc/mysql/mariadb.conf.d/
ADD tools/start.sh /
RUN chmod 777 /start.sh

ENTRYPOINT ["/start.sh"]
