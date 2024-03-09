#!/bin/bash

# sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mariadb -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

mariadb-admin -u root -p$MYSQL_PASSWORD shutdown

mariadbd-safe
