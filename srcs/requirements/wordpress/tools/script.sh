#!/bin/bash

sed -i 's/\;clear_env = no/clear_env = no/g' /etc/php/8.2/fpm/pool.d/www.conf

echo "\nlisten=wordpress:9000" >> /etc/php/8.2/fpm/pool.d/www.conf


# wp config create	--allow-root \
#                     --dbname=$SQL_DATABASE \
#                     --dbuser=$SQL_USER \
#                     --dbpass=$SQL_PASSWORD \
#                     --dbhost=mariadb:3306 --path='/var/www/wordpress'
					