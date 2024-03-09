#!/bin/bash

sed -i 's/\;clear_env = no/clear_env = no/g' /etc/php/8.2/fpm/pool.d/www.conf

sed -i 's!listen = /run/php/php8.2-fpm.sock!listen=wordpress:9000!g' /etc/php/8.2/fpm/pool.d/www.conf

wp core download --locale=en_US --allow-root 

wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306

wp core install --url=$DOMAIN_NAME --title=INCEPTION --admin_user=$ADMIN_USR --admin_password=$ADMIN_PSW --admin_email=$ADMIN_EMAIL --allow-root --path=/var/www/html

# wp user create $USER_USR $USER_EMAIL --role=author --user_pass=$USER_PSW --allow-root --path=/var/www/html

wp user create $USER_USR $USER_EMAIL --role=Bios --user_pass=$USER_PSW --allow-root --path=/var/www/html

php-fpm8.2 -F
