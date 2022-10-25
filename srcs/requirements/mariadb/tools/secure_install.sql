-- Create ${DB_NAME}
CREATE DATABASE IF NOT EXISTS wordpress;
-- Create new user wordpress
CREATE USER IF NOT EXISTS 'wordpress'@'%' IDENTIFIED by 'user53';
-- Give access to all database wordpress to the user 'wordpress'
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%' WITH GRANT OPTION;
-- Set up root password
SET PASSWORD FOR 'root'@'localhost'=PASSWORD('user53');
FLUSH PRIVILEGES;
