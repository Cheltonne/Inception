#!/bin/sh

FILE=/var/www/html/wp-config.php
echo "Trying to create wp-config.php file..."
if  [ ! -f "$FILE" ]; then
	echo "Creating config..."
	wp config create --dbname=$DB_NAME --dbuser=$ADMIN_USER --dbpass=$ADMIN_PASSWORD --dbhost="mariadb" --path="/var/www/html/" --allow-root --skip-check
	wp core install --url="chajax.42.fr" --title="I love Inception" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --path="/var/www/html/" --allow-root
	wp user create $USER $EMAIL_USER --role=author --user_pass=$WP_PASSWORD --allow-root
    echo "wp-config.php file created!!"
else
    echo "wp-config.php already created."
fi
exec php-fpm7.3 --nodaemonize
