FROM debian:latest

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

COPY    ./tools/script.sh /tmp

WORKDIR /var/www/html/

RUN chmod u=rwx /tmp/script.sh\
 && chmod u=rwx /usr/local/bin/wp

CMD [ "sh", "/tmp/script.sh" ]