FROM    debian:buster

RUN     apt-get update && apt-get install nginx -y

COPY    ./nginx.conf /etc/nginx/nginx.conf

EXPOSE  80/tcp

CMD     ["/usr/sbin/nginx", "-g", "daemon off;"]
