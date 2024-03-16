FROM debian:11

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp

RUN apt update -y\
 && apt upgrade -y\
 && apt install php7.4 -y\
 && apt install php7.4-fpm -y\
 && apt install php-mysql -y\
 && apt install mariadb-client -y

COPY    ./tools/setup.bash /tmp

WORKDIR /var/www/html/

RUN chmod u=rwx /tmp/setup.bash\
 && chmod u=rwx /usr/local/bin/wp

EXPOSE 9000

CMD [ "bash", "/tmp/setup.bash" ]