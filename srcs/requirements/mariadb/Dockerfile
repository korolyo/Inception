FROM debian:buster


RUN apt update &&  \
    apt install mariadb-server -y && rm -rf /var/lib/apt/lists/*; \
    sed -i 's/^bind-address/#&/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/start.sh /

RUN	chmod +x /start.sh

VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306

ENTRYPOINT ["bash", "/start.sh"]
