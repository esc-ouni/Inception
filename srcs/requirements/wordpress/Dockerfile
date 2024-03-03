FROM debian:12

ADD https://wordpress.org/wordpress-6.4.3.zip .

RUN apt update -y\
 && apt upgrade -y\
 && apt install vim -y\
 && apt install wget -y\
 && apt install php -y\
 && apt install php-fpm -y\
 && apt install php-mysql -y\
 && apt install mariadb-client -y\
 && apt install unzip -y

# RUN		chown -R root:root /var/www/wordpress

COPY ./tools/script.sh /tmp

# ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp

RUN chmod u=rwx /tmp/script.sh\
 && sh /tmp/script.sh

CMD [ "/usr/sbin/php-fpm8.2", "-F" ]