#!/bin/bash

# sed -i 's!listen = /run/php/php7.4-fpm.sock!listen=wordpress:9000!g' /etc/php/7.4/fpm/pool.d/www.conf

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ${SSLKEY_} -out ${CERTS_} -subj "/C=MA/ST=Khouribga/L=Byout/O=1337/CN=1337.Inception.com/OU=Byout"\
        2>/dev/null

echo "server {
    listen              443 ssl;

    ssl_certificate     ${CERTS_};
    ssl_certificate_key ${SSLKEY_};

    ssl_protocols       TLSv1.3;

    server_name         idouni.42.fr;
	root                /var/www/html;
	index               index.php; 

    location ~ \.php$ {
        include       /etc/nginx/snippets/fastcgi-php.conf;
        fastcgi_pass  wordpress:9000;
    }
}" > /etc/nginx/conf.d/nginx.conf

echo "daemon off;" >> /etc/nginx/nginx.conf

nginx