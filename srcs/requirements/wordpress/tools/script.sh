#!/bin/bash

sed -i 's/\;clear_env = no/clear_env = no/g' /etc/php/8.2/fpm/pool.d/www.conf

echo "\nlisten=wordpress:9000" >> /etc/php/8.2/fpm/pool.d/www.conf

wp core download --locale=en_US --allow-root 

wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306

wp core install --allow-root --url=$DOMAIN_NAME --title=INCEPTION --admin_user=$MYSQL_USER --admin_password=$MYSQL_PASSWORD --admin_email=email --path=/var/www/html

wp user create --allow-root $MYSQL_USER email --role=author --user_pass=$MYSQL_PASSWORD --path=/var/www/html

php-fpm8.2 -F
