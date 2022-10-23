-- add password to root user
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('');
-- create Wordpress database
CREATE DATABASE ;
CREATE USER ''@'%' IDENTIFIED by '';
GRANT ALL PRIVILEGES ON .* TO ''@'%';
FLUSH PRIVILEGES;
