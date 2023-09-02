#!/bin/sh
# sleep 5
echo "clear_env=no" >> /etc/php/7.3/fpm/php-fpm.conf
echo "listen=wordpress:9000" >> /etc/php/7.3/fpm/php-fpm.conf
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