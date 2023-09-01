FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y mariadb-server
RUN mkdir -p /tmp/mariadb

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/entrypoint.sh /tmp/mariadb/entrypoint.sh

RUN chmod +x /tmp/mariadb/entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["sh", "/tmp/mariadb/entrypoint.sh"]