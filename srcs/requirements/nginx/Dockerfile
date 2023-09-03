FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install nginx openssl -y

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./tools/entrypoint.sh /tmp/entrypoint.sh

RUN chmod +x /tmp/entrypoint.sh

EXPOSE 443

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]