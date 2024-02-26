FROM debian:12

# Install dependencies
RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    wget \
    unzip \
    curl \
    && apt-get clean 

# Download WordPress
    # && tar -xzf wordpress.tar.gz -C /var/www/ 
    # && rm wordpress.tar.gz 
    # && chown -R www-data:www-data /var/www/wordpress

# Copy WordPress configuration
# COPY wp-config.php /var/www/wordpress

# Adjust PHP-FPM configuration to listen on a socket or network port
# RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

# Expose the port PHP-FPM listens on


# Start PHP-FPM

WORKDIR /var/www/html 


COPY *.sh .

RUN chmod +x script.sh
CMD ["sh", "-c", "while true; do sleep 1; done"]
#ENTRYPOINT  ["sh ", "script.sh"]

