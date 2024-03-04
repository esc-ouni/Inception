FROM debian:12

ADD https://wordpress.org/wordpress-6.4.3.zip /tmp/
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp

RUN apt update -y\
 && apt install netcat-traditional -y\
 && apt upgrade -y\
 && apt install vim -y\
 && apt install wget -y\
 && apt install php8.2 -y\
 && apt install php8.2-fpm -y\
 && apt install php-mysql -y\
 && apt install mariadb-client -y\
 && apt install unzip -y


COPY ./tools/script.sh /tmp

WORKDIR /var/www/wordpress/

RUN chmod u=rwx /tmp/script.sh\
 && chmod u=rwx /usr/local/bin/wp\
 && sh /tmp/script.sh\
 && chown -R root:root /var/www/wordpress

CMD [ "/usr/sbin/php-fpm8.2", "-F" ]
