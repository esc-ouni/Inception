#!/bin/bash

unzip -q /tmp/wordpress-6.4.3.zip -d /var/www

cp -rf /var/www/wordpress/* /var/www/html/. #WHYYY

sed -i 's/\;clear_env = no/clear_env = no/g' /etc/php/8.2/fpm/pool.d/www.conf

echo "\nlisten=wordpress:9000" >> /etc/php/8.2/fpm/pool.d/www.conf

# cp -rf /var/www/html/wp-config-sample.php /var/www/html/wp-config.php #when_db_ready

# dBase

sleep 10

cd /var/www/html

wp core download --allow-root 

cp wp-config-sample.php wp-config.php

# wp config set SERVER_PORT 3306 --allow-root
# wp config set DB_NAME $MYSQL_DATABASE --allow-root --path=/var/www/html
# wp config set DB_USER $MYSQL_USER --allow-root --path=/var/www/html
# wp config set DB_PASSWORD $MYSQL_PASSWORD --allow-root --path=/var/www/html
# wp config set DB_HOST 'mariadb:3306' --allow-root --path=/var/www/html
# wp core install --url=$DOMAIN_NAME --title=INCEPTION --admin_user=$MYSQL_USER --admin_password=$MYSQL_PASSWORD --admin_email=email --allow-root --path=/var/www/html
# wp user create $MYSQL_USER email --role=author --user_pass=$MYSQL_PASSWORD --allow-root --path=/var/www/html

rm -rf /tmp/*

					