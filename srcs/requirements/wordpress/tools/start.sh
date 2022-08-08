#!/bin/bash

mkdir -p /run/php
touch /run/php/php7.3-fpm.pid;

echo "Trying to connect to mariadb.."
while ! mysql -h mariadb -u acollin -p1234 -e "SELECT 'OK' AS status;"; do
  sleep 5
done

echo "Wordpress connected to db!"
if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
# static website
mkdir -p /var/www/html/wordpress/mysite;
mv /var/www/index.html /var/www/html/wordpress/mysite/index.html;
cd /var/www/html/wordpress;

wp core download --allow-root;
cp /var/www/wp-config.php /var/www/html/wordpress/;
wp core install --url=${DOMAIN_NAME} --title=${WP_DB_NAME} --admin_user=${WP_ADMIN_NAME} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL} --skip-email --allow-root;
wp user create ${WP_USR_NAME} ${WP_USR_EMAIL} --role=author --user_pass=${WP_USR_PWD} --allow-root;
wp theme install inspiro --activate --allow-root
fi

echo "Wordpress started on :9000"
/usr/sbin/php-fpm7.3 --nodaemonize

