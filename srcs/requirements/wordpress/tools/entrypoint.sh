#!/bin/sh
sleep 5
wp config create --dbname=${DB_NAME} \
                 --dbuser=${DB_USER} \
                 --dbpass=${DB_PASSWORD} \
                 --dbhost=mariadb:3306 \
                 --path=${WP_PATH} \
                 --allow-root \
                 --path="/var/www/html/wordpress"

wp core install --url=${WP_URL} \
                --title=${WP_TITLE} \
                --admin_user=${WP_USER} \
                --admin_password=${WP_PASSWORD} \
                --admin_email=${WP_EMAIL} \
                --allow-root \
                --path="/var/www/html/wordpress"
/usr/sbin/php-fpm7.3 --nodaemonize
exec "$@"