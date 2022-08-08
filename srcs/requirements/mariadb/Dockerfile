FROM debian:buster

RUN apt update &&  \
    apt install mariadb-server -y && rm -rf /var/lib/apt/lists/*; \
    sed -i 's/^bind-address/#&/' /etc/mysql/mariadb.conf.d/50-server.cnf && \
    sed -i "s/#port/port/"      /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/schema.sql /

RUN	chmod +x /schema.sql && \
    chown -R mysql:mysql /var/lib/mysql

RUN service mysql start && mysql < schema.sql

VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306

CMD /usr/bin/mysqld_safe
