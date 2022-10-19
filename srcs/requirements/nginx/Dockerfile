FROM    debian:buster

RUN     apt-get update && apt-get install nginx -y

COPY    ./conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE  80/tcp
EXPOSE  443/tcp

CMD     ["/usr/sbin/nginx", "-g", "daemon off;"]
