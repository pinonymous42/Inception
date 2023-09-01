FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y nginx openssl vim
RUN mkdir -p /tmp/nginx
RUN chown www-data:www-data -R /var/www/html ${SSL_CRT_PATH} ${SSL_KEY_PATH}

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./tools/entrypoint.sh /tmp/nginx/entrypoint.sh

RUN chmod +x /tmp/nginx/entrypoint.sh

EXPOSE 443

ENTRYPOINT ["sh", "/tmp/nginx/entrypoint.sh"]