FROM        debian:buster

RUN         apt-get update && apt-get install -y mariadb-server

EXPOSE      3306

#HEALTHCHECK --start-period=5m \
 #  CMD mariadb -e 'SELECT @@datadir;' || exit 1

COPY        ./entrypoint/entrypoint.sh /usr/local/bin/

ENTRYPOINT  ["entrypoint.sh"]

CMD         ["mysqld"]
