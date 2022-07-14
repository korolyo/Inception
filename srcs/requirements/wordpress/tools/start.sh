#!/bin/sh

if [ ! -f "/var/www/html/index.html" ]; then

    # static website
    mv /index.html /var/www/html/index.html

    wp core download --allow-root
    wp core install --url=$DOMAIN_NAME/wordpress --title=$WP_DB_NAME --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USR_NAME $WP_USR_EMAIL --role=author --user_pass=$WP_USR_PWD --allow-root
    wp theme install inspiro --activate --allow-root

fi

echo "Wordpress started on :9000"
/usr/sbin/php-fpm7 -F -R