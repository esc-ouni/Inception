#!/bin/bash

mysqld_safe &

mariadb -u root <<EOF
CREATE DATABASE $MYSQL_DATABASE;
CREATE USER $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO $MYSQL_USER@'%';
FLUSH PRIVILEGES;
EOF

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

# mysqld_safe

echo "=> DATA_BASEEEEEE"
