#!/bin/bash

sed -i 's!listen = /run/php/php7.4-fpm.sock!listen=wordpress:9000!g' /etc/php/7.4/fpm/pool.d/www.conf

mkdir /run/php/

touch /run/php/php7.4-fpm.pid

wp core download --locale=en_US --allow-root 

wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --allow-root

wp core install --url=$DOMAIN_NAME --title=INCEPTION --admin_user=$ADMIN_USR --admin_password=$ADMIN_PSW --admin_email=$ADMIN_EMAIL --allow-root

wp user create $USER_USR $USER_EMAIL --role=author --user_pass=$USER_PSW --allow-root

php-fpm7.4 -F
