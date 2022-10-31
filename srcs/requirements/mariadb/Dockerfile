FROM    debian:buster

RUN     apt-get update && apt-get install -y \
        mariadb-server \
        mariadb-client \
        gettext-base \
        && rm -rf /var/lib/apt/lists/*

#Allow to run the daemon of mysql
# Purge and re-create /var/lib/mysql with appropriate ownership
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
RUN     mkdir -p /var/run/mysqld \
        && chown -R mysql:mysql /var/run/mysqld \
        && chmod 777 /var/run/mysqld 

COPY    ./tools/entrypoint.sh /usr/local/bin/
COPY    ./tools/init.sql /var/
COPY    ./tools/wordpress_db.sql /var/

EXPOSE  3306

CMD     ["entrypoint.sh" ]
