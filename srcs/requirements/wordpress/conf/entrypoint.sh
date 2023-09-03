#!/bin/sh
wp config create	--path=$WP_PATH \
					--dbname=$DB_NAME \
					--dbuser=$DB_USER \
					--dbpass=$DB_PASSWORD \
					--dbhost=mariadb \
					--allow-root

wp core install --title=$WP_TITLE \
				--admin_user=$WP_USER \
				--admin_password=$WP_PASSWORD \
				--admin_email=$WP_EMAIL \
				--url=$WP_URL \
				--allow-root

#/usr/sbin/php-fpm7.3 -F