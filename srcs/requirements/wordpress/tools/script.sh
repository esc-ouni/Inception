#!/bin/bash

sed -i 's!listen = /run/php/php8.2-fpm.sock!listen=wordpress:9000!g' /etc/php/8.2/fpm/pool.d/www.conf

wp core download --locale=en_US --allow-root 

wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --allow-root

wp core install --url=$DOMAIN_NAME --title=INCEPTION --admin_user=$ADMIN_USR --admin_password=$ADMIN_PSW --admin_email=$ADMIN_EMAIL --allow-root

wp user create $USER_USR $USER_EMAIL --role=author --user_pass=$USER_PSW --allow-root

php-fpm8.2 -F
