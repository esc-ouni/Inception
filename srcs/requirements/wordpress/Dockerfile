FROM debian:12

# Install dependencies
# RUN apt-get update -y\
#  && apt-get upgrade -y\
#  && apt install unzip -y\
#  && apt install php-fpm -y 

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    wget \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ADD https://wordpress.org/latest.tar.gz /var/www/html/

# RUN && unzip latest.tar.gz -d /var/www/html/ \
#     && chown -R www-data:www-data /var/www/html/wordpress

RUN wget https://wordpress.org/latest.zip \
    && unzip latest.zip -d /var/www/html/ \
    && rm latest.zip \
    && chown -R www-data:www-data /var/www/html/wordpress

# WORKDIR /

# COPY script.sh .

# RUN chmod u=rwx script.sh

RUN sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/' /etc/php/8.2/fpm/pool.d/www.conf

EXPOSE 9000

CMD ["php-fpm8.2", "-F"]
