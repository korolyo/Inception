FROM debian:buster

RUN apt-get update -y && \
    apt-get install -y openssl nginx && \
    rm -rf /var/lib/apt/lists/*

ADD conf/nginx.conf /etc/nginx/sites-available/default
ADD tools/start.sh /var/www/

RUN chmod +x /var/www/start.sh
RUN /var/www/start.sh

ENTRYPOINT ["nginx", "-g", "daemon off;"]