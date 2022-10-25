#!/bin/sh

cat <<-EOF > /etc/mysql/my.cnf
    [mysqld]
    user = root
    port = 3306
    datadir = /var/lib/mysql
    bind-address = 0.0.0.0
    skip-bind-address
    skip-networking = false
    pid-file = /run/mysqld/mysqld.pid
    socket = /run/mysqld/mysqld.sock
EOF

FILE=/var/lib/mysql/.db_createII
if  [ ! -f "$FILE" ]
then
	echo "Creating Database...\n"
	envsubst < /var/init.sql > /var/init_env.sql
	service mysql start
	mysql -D mysql < /var/init_env.sql | true
	touch /var/lib/mysql/.db_create
	service mysql stop | echo -n ""
    echo "Database created.\n"
else
    echo "Database already created! Silly you... :$"
fi

exec mysqld_safe -u root -p=${ADMIN_PASSWORD}
echo "Database created.\n"
