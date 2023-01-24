#!/bin/sh

while ! mariadb -hmariadb -u$ADMIN_USER -p$ADMIN_PASSWORD wordpress 2> /dev/null; do
    sleep 3
done

FILE=/var/www/html/wp-config.php
echo "Trying to create wp-config.php file..."
if  [ ! -f "$FILE" ]; then
	echo "Creating config..."
	wp config create --dbname=$DB_NAME --dbuser=$ADMIN_USER --dbpass=$ADMIN_PASSWORD --dbhost="mariadb" --path="/var/www/html/" --allow-root --skip-check
	wp core install --url=https://chajax.42.fr --title="J'ai litteralement 0 jours de BH O__O" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --path="/var/www/html/" --allow-root
	wp user create $USER $EMAIL_USER --role=author --user_pass=$WP_PASSWORD --allow-root
	wp theme activate twentytwentytwo --allow-root
	wp plugin install redis-cache --activate --allow-root
	wp redis enable --allow-root
	sed -i '40 a\define( '\''WP_REDIS_HOST'\'', '\''redis'\'' );' /var/www/html/wp-config.php
    echo "wp-config.php file created!!"
else
    echo "wp-config.php already created."
fi
exec php-fpm7.3 --nodaemonize
