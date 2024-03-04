#!/bin/bash

unzip -q /tmp/wordpress-6.4.3.zip -d /var/www

cp -rf /var/www/wordpress/* /var/www/html/. #WHYYY

sed -i 's/\;clear_env = no/clear_env = no/g' /etc/php/8.2/fpm/pool.d/www.conf

echo "\nlisten=wordpress:9000" >> /etc/php/8.2/fpm/pool.d/www.conf

# dB

sleep 10

# wp config create	--allow-root \
#                     --dbname=$SQL_DATABASE \
#                     --dbuser=$SQL_USER \
#                     --dbpass=$SQL_PASSWORD \
#                     --dbhost=mariadb:3306 --path='/var/www/wordpress'

rm -rf /tmp/*

					