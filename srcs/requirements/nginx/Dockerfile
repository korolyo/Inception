FROM alpine:3.14

COPY conf/nginx.conf

RUN apk update; apk add nginx

EXPOSE 443

#ENTRYPOINT [""]
ENTRYPOINT ["tail", "-f"]

