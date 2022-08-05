#!/bin/bash

mkdir -p /run/php

while ! mysql -h mariadb -u $MYSQL_DB_USER -p$MYSQL_DB_PWD $MYSQL_DB_NAME -e "SELECT 'OK' AS status;"; do
  sleep 3
done

if [ ! -f "/var/www/html/index.html" ]; then

    # static website
    mv /index.html /var/www/wordpress/html/index.html
    sleep 3

    wp core download --path=/usr/src/wordpress --allow-root
    wp core config  --path=/var/www/wordpress --dbname=$WP_DB_NAME --dbuser=$WP_USR_NAME --dbpass=$WP_USR_PWD --dbhost=$MYSQL_HOST --dbcharset="utf8" --allow-root
    wp core install --path=/var/www/wordpress --url=$DOMAIN_NAME/wordpress --title=$WP_DB_NAME --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create --path=/var/www/wordpress $WP_USR_NAME $WP_USR_EMAIL --role=author --user_pass=$WP_USR_PWD --allow-root
    wp theme install inspiro --activate --allow-root

fi

echo "Wordpress started on :9000"
/usr/sbin/php-fpm7 --nodaemonize

