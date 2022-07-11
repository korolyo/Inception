FROM alpine:3.14

RUN apk upgrade --update-cache --available && \
    apk add --no-cache openssl nginx && \
    rm -rf /var/cache/apk/*

EXPOSE 443

COPY conf/nginx.conf /etc/nginx/conf.d/
COPY tools/start.sh /var/www/
RUN chmod 777 /var/www/start.sh
RUN /var/www/start.sh

ENTRYPOINT ["nginx", "-g", "daemon off;"]