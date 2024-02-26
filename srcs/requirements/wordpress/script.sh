#!/bin/bash


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar


chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp 

wp core download --allow-root

wp core config create --dbname=your_database_name --dbuser=your_database_user --dbpass=your_database_password --dbhost=localhost --dbprefix=wp_ --allow-root

wp core install --url=your_site_url --title="Your Site Title" --admin_user=admin_username --admin_password=admin_password --admin_email=admin_email@example.com
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf --allow-root

bash php-fpm8.2 -F