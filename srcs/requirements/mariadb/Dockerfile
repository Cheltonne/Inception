FROM        debian:buster

RUN         apt update && apt install -y mariadb-client mariadb-server

COPY        ./entrypoint/entrypoint.sh /usr/local/bin/
COPY        ./entrypoint/init.sql /var/

CMD  ["entrypoint.sh"]
