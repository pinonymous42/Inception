FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/entrypoint.sh /tmp/entrypoint.sh

RUN chmod +x /tmp/entrypoint.sh
EXPOSE 3306

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
CMD ["mysqld"]