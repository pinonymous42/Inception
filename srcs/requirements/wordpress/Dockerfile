FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y curl php7.3 php7.3-fpm php-mysql mariadb-client -y	
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp 
RUN mkdir -p /var/www/html/wordpress \
	&& wp core download --path=/var/www/html/wordpress --allow-root 
RUN chown -R root:root /var/www/html/wordpress
#RUN echo "clear_env=no" >> /etc/php/7.3/fpm/php-fpm.conf
#RUN echo "listen=wordpress:9000" >> /etc/php/7.3/fpm/php-fpm.conf
RUN mkdir -p /run/php

COPY conf/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

WORKDIR /var/www/html/wordpress

EXPOSE 9000

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
CMD ["/usr/sbin/php-fpm7.3", "-F"]