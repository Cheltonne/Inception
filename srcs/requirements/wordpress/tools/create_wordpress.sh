#!/bin/sh

FILE=/var/www/html/.exist

if  [ ! -f "$FILE" ]; then
	echo "Creating config..."
	rm -rf /var/www/html/wp-config.php
	wp config create --dbname=$DB_NAME --dbuser="wordpress" --dbpass=$WP_PASSWORD --dbhost="mariadb" --path="/var/www/html/" --allow-root --skip-check
	wp core install --url="localhost" --title="chajax awesome site" --admin_user="chajax" --admin_password="ADMIN_PASSWORD" --admin_email="chajax@student.42.fr" --path="/var/www/html/" --allow-root
	wp user create chajax chajax@student.42.fr --role=author --user_pass="WP_PASSWORD" --allow-root
	touch /var/www/html/.exist
    echo "Config done!"
else
    echo "Config already done"
fi
exec php-fpm7.3 --nodaemonize
