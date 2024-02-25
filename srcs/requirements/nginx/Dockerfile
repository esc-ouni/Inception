FROM debian:bullseye

RUN apt-get update -y\
 && apt-get upgrade -y\
 && apt-get install nginx openssl -y

#rm default config
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt \
-subj "/C=US/ST=New York/L=New York City/O=Example Company/OU=IT Department/CN=example.com"
RUN cp nginx.crt /etc/nginx/ssl \
 && cp nginx.key /etc/nginx/ssl

COPY ./nginx.conf /etc/nginx/conf.d

EXPOSE 443
EXPOSE 80

# CMD ["nginx"]

CMD ["nginx", "-g", "daemon off;"]