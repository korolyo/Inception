openssl req -x509 -nodes -newkey rsa:4096 \
        -keyout /etc/ssl/private/nginx-selfsigned.key \
        -out /etc/ssl/certs/nginx-selfsigned.crt \
        -subj "/C=RU/ST=Moscow/L=21school/O=Acollin/OU=acollin.42.fr/CN=acollin";