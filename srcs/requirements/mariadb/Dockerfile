FROM debian:buster

VOLUME [ “/var/lib/mysql” ]

RUN apt update &&  \
    apt install sudo mariadb-server -y && rm -rf /var/lib/apt/lists/*; \
    sed -i 's/^bind-address/#&/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/start.sh /

RUN	chmod +x /start.sh

ENTRYPOINT ["bash", "/start.sh"]