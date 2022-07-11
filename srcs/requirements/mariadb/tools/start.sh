if [ -d "/run/mysqld" ]; then
        echo " mysqld already present, skipping creation"
        chown -R mysql:mysql /run/mysqld
else
        echo " mysqld not found, creating...."
        mkdir -p /run/mysqld
        chown -R mysql:mysql /run/mysqld
fi

if [ -d /var/lib/mysql/mysql ]; then
        echo "MySQL data directory already present, skipping creation"
        chown -R mysql:mysql /var/lib/mysql
else
        echo "MySQL data directory not found, creating initial DBs"

        chown -R mysql:mysql /var/lib/mysql

        mysql_install_db --user=mysql --ldata=/var/lib/mysql > /dev/null

        if [ "$MYSQL_ROOT_PASSWORD" = "" ]; then
            MYSQL_ROOT_PASSWORD='pwdf 15 11'
            echo "MySQL root Password: $MYSQL_ROOT_PASSWORD"
        fi

        MYSQL_DB_NAME=${MYSQL_DB_NAME:-""}
        MYSQL_USER=${MYSQL_USER:-""}
        MYSQL_PASSWORD=${MYSQL_PASSWORD:-""}

        tfile=`mktemp`
        if [ ! -f "$tfile" ]; then
	        return 1
	    fi

	    cat << EOF > $tfile
USE mysql;
FLUSH PRIVILEGES ;
GRANT ALL ON *.* TO 'root'@'%' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
GRANT ALL ON *.* TO 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}') ;
DROP DATABASE IF EXISTS test ;
FLUSH PRIVILEGES ;
EOF

		echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DB_NAME\` CHARACTER SET $MYSQL_CHARSET COLLATE $MYSQL_COLLATION;" >> $tfile
		echo "CREATE USER IF NOT EXISTS 'acollin'@'%' IDENTIFIED BY '123';" >> $tfile
		echo "GRANT ALL ON \`$MYSQL_DB_NAME\`.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> $tfile

	    /usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < $tfile
	    rm -f $tfile
