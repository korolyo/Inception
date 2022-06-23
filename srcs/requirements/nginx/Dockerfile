FROM alpine:3.14

RUN apk upgrade --update-cache --available && \
    apk add openssl && \
    apk add nginx && \
    rm -rf /var/cache/apk/*


COPY conf/nginx.conf /etc/nginx/conf.d/
COPY tools/start.sh /var/www

EXPOSE 443

CMD bash /var/www/start.sh

