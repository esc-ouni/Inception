FROM debian:12

RUN apt update -y\
 && apt upgrade -y\
 && apt install nginx openssl -y

WORKDIR /etc/nginx/openssl/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt -subj "/C=MA/ST=Khouribga/L=Byout/O=1337/CN=1337.Inception.com/OU=Byout"

COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

RUN chmod u=rwx /var/www/html\
 && chown -R www-data:www-data /var/www/html/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
