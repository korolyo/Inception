FROM debian:buster

RUN         apt-get update -y && \
            apt-get install -y bash tar vim mariadb-client wget \
            php7.3 \
            php-mysql \
            php-fpm	&& \
            rm -rf /var/lib/apt/lists/* && \
            mkdir -p /var/www/data/


ADD tools/www.conf /etc/php/7.3/fpm/pool.d/www.conf
ADD tools/index.html /

RUN chmod 777 /etc/php/7.3/fpm/pool.d/www.conf && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp 

WORKDIR /var/www/html/wordpress

COPY tools/start.sh /
ENTRYPOINT ["bash", "/start.sh"]