#!/bin/bash

# Замените все вхождения строки в файле, перезаписав файл (т.е. на месте):
sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/" "/etc/php/7.4/fpm/pool.d/www.conf";
# -R рекурсивное изменение прав доступа для каталогов и их содержимого
chmod -R 775 /var/www/html/wordpress;
# Следующий пример изменит владельца всех файлов и
# подкаталогов в /var/www/html/wordpress каталоге на нового владельца и группу с именем www-data :
chown -R www-data /var/www/html/wordpress;
mkdir -p /run/php/;
touch /run/php/php7.4-fpm.pid;

# php -S 0.0.0.0:9000 -t /var/www/html/wordpress

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
echo "Wordpress: setting up..."
# После проверки требований загрузите файл wp-cli.phar , используя wget или curl:
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
# «+x» означает — установить разрешение на запуск (x) файла для всех пользователей.
chmod +x wp-cli.phar;
# Чтобы использовать WP-CLI из командной строки, набрав wp, сделайте файл исполняемым и
# переместите его куда-нибудь в PATH. Например:
mv wp-cli.phar /usr/local/bin/wp;
cd /var/www/html/wordpress;
# Загружает и извлекает основные файлы WordPress по указанному пути

# static website
	mkdir -p /var/www/html/wordpress/mysite;
    mv /var/www/index.html /var/www/html/wordpress/mysite/index.html;

wp core download --allow-root;
mv /var/www/wp-config.php /var/www/html/wordpress;
echo "Wordpress: creating users..."
wp core install --allow-root --url=${DOMAIN_NAME} --title=${WORDPRESS_DB_NAME} --admin_user=${WORDPRESS_DB_USER} --admin_password=${WORDPRESS_DB_PASSWORD} --admin_email=${WORDPRESS_USER_EMAIL};

wp user create ${MYSQL_USER} ${WORDPRESS_USER_EMAIL} --user_pass=${MYSQL_PASSWORD} --role=author --allow-root;
# Тема для WordPress
wp theme install inspiro --activate --allow-root

echo "Wordpress started on :9000"
/usr/sbin/php-fpm7.4 -F