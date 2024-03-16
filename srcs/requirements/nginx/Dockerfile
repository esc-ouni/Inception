FROM debian:11

RUN apt update -y\
 && apt upgrade -y\
 && apt install nginx openssl -y

COPY ./tools/setup.bash /tmp

RUN chmod u=rwx /tmp/setup.bash\
 && chmod u=rwx /var/www/html\
 && chown -R www-data:www-data /var/www/html/

EXPOSE 443

CMD [ "bash", "/tmp/setup.bash" ]
