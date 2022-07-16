FROM alpine:3.14

ARG WP_DB_NAME, WP_DB_USER, WP_DB_PWD, WP_DB_ROOT_PWD

RUN apk update && apk add --no-cache mysql mysql-client openrc && \
    rm -f /var/cache/apk/*

COPY tools/start.sh /

RUN chmod +x /start.sh

ENTRYPOINT ["sh", "/start.sh"]
