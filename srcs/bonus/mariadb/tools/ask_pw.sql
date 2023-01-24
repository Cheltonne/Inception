USE mysql;
UPDATE user SET plugin = "" WHERE user = "root";
UPDATE user SET password = PASSWORD("root") WHERE user = "root";
FLUSH PRIVILEGES;
