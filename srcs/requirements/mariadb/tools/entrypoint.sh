#!/bin/sh
service mysql start

echo "CREATE DATABASE inception;" > setting.sql
echo "CREATE USER 'kohmatsu'@'%' IDENTIFIED BY 'a';" >> setting.sql
echo "GRANT ALL ON inception.* TO 'kohmatsu'@'%';" >> setting.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'r';" >> setting.sql
echo "FLUSH PRIVILEGES;" >> setting.sql

mysql < setting.sql
kill $(cat /var/run/mysqld/mysqld.pid)

mysqld