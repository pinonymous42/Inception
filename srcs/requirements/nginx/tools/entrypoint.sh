#!/bin/sh

mkdir -p /etc/nginx/ssl -p /var/run/nginx

openssl req -newkey rsa:2048 -nodes -x509 -days 3650 \
        -keyout ${SSL_KEY_PATH} \
        -out ${SSL_CRT_PATH} \
        -subj "/C=JP/ST=TOKYO/L=ROPPONGI/O=42 TOKYO/OU=kohmatsu/CN=kohmatsu"

chmod 755 /var/www/html
chown www-data:www-data -R /var/www/html ${SSL_CRT_PATH} ${SSL_KEY_PATH}
#chmod 600 ${SSL_KEY_PATH}
#chmod 600 ${SSL_CRT_PATH}
nginx -g "daemon off;"
# exec "$@"