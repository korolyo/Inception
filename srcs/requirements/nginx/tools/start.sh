openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key
        -out /etc/ssl/certs/nginx-selfsigned.crt \
        -subj "/C=RU/ST=Moscow/L=21school/O=Acollin/OU=Org/CN=acollin.42.fr";

nginx -g 'daemon off;'