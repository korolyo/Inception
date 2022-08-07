chown -R mysql:mysql /var/lib/mysql

if [ ! -d "/var/lib/mysql/$MYSQL_DB_NAME" ]; then
service mysql start
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME DEFAULT CHARACTER SET utf8;"
mysql -u root -e "CREATE USER '$MYSQL_DB_USER'@'%' IDENTIFIED by '$MYSQL_DB_PWD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO $MYSQL_DB_USER@'%'"
mysql -u root -e "FLUSH PRIVILEGES;"
mysqladmin -u root password $MYSQL_DB_ROOT_PWD
service mysql stop
fi

/usr/bin/mysqld_safe
