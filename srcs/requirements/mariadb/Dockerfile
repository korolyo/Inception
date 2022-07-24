FROM alpine:3.14

VOLUME [“/sys/fs/cgroup”]

RUN apk update && apk upgrade && \
    apk add mariadb mariadb-common mariadb-client openrc sudo

COPY conf/my.cnf /etc/
COPY tools/start.sh /

RUN	chmod +x /start.sh

ENTRYPOINT ["sh", "/start.sh"]