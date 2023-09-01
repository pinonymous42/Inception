FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y mariadb-client \
    curl php7.3 php7.3-fpm php-mysqli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp 
RUN mkdir -p /var/www/html/wordpress && wp core download --allow-root --path=/var/www/html/wordpress
RUN chown -R root:root /var/www/html/wordpress
RUN mkdir -p /tmp/wordpress -p /run/php

COPY ./tools/entrypoint.sh /tmp/wordpress/entrypoint.sh

RUN chmod +x /tmp/wordpress/entrypoint.sh
WORKDIR /var/www/html/wordpress

EXPOSE 9000

ENTRYPOINT [ "sh", "/tmp/wordpress/entrypoint.sh" ]