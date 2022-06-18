FROM alpine:3.14

RUN apk update && apk add mysql mysql-client

COPY ./conf/50-server.cnf /

EXPOSE 3306

HEALTHCHECK

ENTRYPOINT ["mysqld"]
#ENTRYPOINT ["tail", "-f"]
