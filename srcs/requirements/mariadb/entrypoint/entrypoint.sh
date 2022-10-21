#!bin/sh

<< EOF mysql_secure_installation
${MYSQL_ROOT_PASSWORD}
n
n
EOF
