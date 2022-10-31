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

if  [ ! -d "/var/lib/mysql/$DB_NAME" ]
then
    service mysql start
    /usr/bin/mysql_install_db
	echo "Creating \"wordpress\" database with secure_install...\n"
    apt-get update
    apt-get install -y expect
    SECURE_MYSQL=$(expect -c "
    set timeout 10
    spawn mysql_secure_installation
    expect \"Enter current password for root (enter for none):\"
    send \"$ADMIN_PASSWORD\r\"
    expect \"Change the root password?\"
    send \"n\r\"
    expect \"Remove anonymous users?\"
    send \"y\r\"
    expect \"Disallow root login remotely?\"
    send \"y\r\"
    expect \"Remove test database and access to it?\"
    send \"y\r\"
    expect \"Reload privilege tables now?\"
    send \"y\r\"
    expect eof
    ")
    echo "$SECURE_MYSQL"
    apt-get purge -y expect
    echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$ADMIN_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot
    echo "CREATE DATABASE IF NOT EXISTS $DB_NAME; GRANT ALL ON $DB_NAME.* TO 'chajax'@'%' IDENTIFIED BY '$ADMIN_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root
    echo "\"$DB_NAME\" database created.\n"
    echo "Now importing wordpress_db dump to bypass installation process..."
    mysql -uroot -p$ADMIN_PASSWORD $DB_NAME < /var/wordpress_db.sql
    echo "Database dump import done!"
else
    echo "Database already created! Silly you... :$\n"
fi
service mysql stop
exec mysqld_safe --bind-address=0.0.0.0 
