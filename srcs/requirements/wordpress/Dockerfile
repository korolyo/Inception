FROM debian:buster

RUN         apt-get update -y && \
            apt-get install -y mariadb-client wget \
            php7.3 \
            php-mysql \
            php-pdo \
            php-gd \
            php-cli \
            php-fpm	&& \
            rm -rf /var/lib/apt/lists/* && \
            mkdir -p /var/www/data/

RUN chmod 777 /etc/php/7.3/fpm/pool.d/www.conf && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN wp core download --path=/usr/src/wordpress --allow-root

ADD tools/www.conf /etc/php/7.3/fpm/pool.d/www.conf
ADD tools/index.html /

COPY tools/start.sh /

VOLUME [ "/var/www" ]

EXPOSE 9000

ENTRYPOINT ["bash", "/start.sh"]