#!/bin/bash

mkdir -p /run/php

echo "Trying to connect to mariadb.."
while ! mysql -h $MYSQL_HOST -u $MYSQL_DB_USER -p$MYSQL_DB_PWD -e "SELECT 'OK' AS status;"; do
  sleep 5
done

echo "Wordpress connected to db!"
if [ ! -f /var/www/wordpress/wp-config.php ]; then
# static website
mkdir /var/www/wordpress/html/
mv /index.html /var/www/wordpress/html/index.html
sleep 3
cp -R /usr/src/wordpress /var/www
wp core config --path=/var/www/wordpress --dbhost=${MYSQL_HOST} --dbname=${MYSQL_DB_NAME} --dbuser=${MYSQL_DB_USER} --dbpass=${MYSQL_DB_PWD} --dbcharset="utf8" --allow-root
wp core install --path=/var/www/wordpress --url=${DOMAIN_NAME} --title=${WP_DB_NAME} --admin_user=${WP_ADMIN_NAME} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL} --skip-email --allow-root
wp user create --path=/var/www/wordpress ${WP_USR_NAME} ${WP_USR_EMAIL} --role=author --user_pass=${WP_USR_PWD} --allow-root
wp theme install inspiro --activate --allow-root
fi

echo "Wordpress started on :9000"
/usr/sbin/php-fpm7.3 --nodaemonize

