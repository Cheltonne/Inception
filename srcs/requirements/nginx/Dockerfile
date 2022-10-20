FROM    debian:buster

RUN     apt-get update && apt-get install \
        nginx -y \
        openssl

RUN mkdir /etc/nginx/ssl

COPY    ./conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE  443/tcp

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/beaugosse.crt \
       -keyout /etc/nginx/ssl/beaugosse.key \
       -subj "/C=FR/ST=Paris/L=Paris/O=42 Paris/OU=chajax/CN=chajax/"

CMD     ["/usr/sbin/nginx", "-g", "daemon off;"]
