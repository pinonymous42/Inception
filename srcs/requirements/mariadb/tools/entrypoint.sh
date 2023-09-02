#!/bin/sh

service mysql start
echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" > setting.sql
echo "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" >> setting.sql
echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';" >> setting.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';" >> setting.sql
echo "FLUSH PRIVILEGES;" >> setting.sql

mysql -u root -p ${DB_ROOT_PASSWORD} < setting.sql
rm -f setting.sql

mysqld
# exec "$@"