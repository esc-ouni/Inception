FROM debian:12

RUN apt-get update -y\
 && apt-get upgrade -y\
 && apt-get install nginx openssl -y

WORKDIR /etc/nginx/ssl/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt -subj "/C=MA/ST=Khouribga/L=Byout/O=1337/CN=1337.Inception.com/OU=Byout"

COPY ./nginx.conf /etc/nginx/conf.d

EXPOSE 443

ENTRYPOINT [ "nginx", "-g"]
CMD ["daemon off;"]
