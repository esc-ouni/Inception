#!/bin/bash

unzip -q /tmp/wordpress-6.4.3.zip -d /var/www

cp -rf /var/www/wordpress/* /var/www/html/. #WHYYY

sed -i 's/\;clear_env = no/clear_env = no/g' /etc/php/8.2/fpm/pool.d/www.conf

echo "\nlisten=wordpress:9000" >> /etc/php/8.2/fpm/pool.d/www.conf

# mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php #testt

# dBase

sleep 10

cd /var/www/html

# wp core download --allow-root 
# mv wp-config-sample.php wp-config.php 
# wp config set SERVER_PORT 3306 --allow-root
# wp config set DB_NAME $MYSQL_DATABASE --allow-root --path=/var/www/html
# wp config set DB_USER $MYSQL_USER --allow-root --path=/var/www/html
# wp config set DB_PASSWORD $MYSQL_PASSWORD --allow-root --path=/var/www/html
# wp config set DB_HOST 'mariadb:3306' --allow-root --path=/var/www/html
# wp core install --url=$DOMAIN_NAME --title=INCEPTION --admin_user=$WORDPRESS_DB_USER --admin_password=$WORDPRESS_DB_PASSWORD --admin_email="eamil.email" --allow-root --path=/var/www/html
# wp user create $WORDPRESS_DB_USER $WP_USER_EMAIL --role=author --user_pass=$WORDPRESS_DB_PASSWORD --allow-root --path=/var/www/html

rm -rf /tmp/*

					