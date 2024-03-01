FROM debian:12

# RUN apt-get update -y\
#  && apt-get upgrade -y\
#  && apt-get install mariadb-server -y
# # #  && service mysql start

# # #  CMD /usr/bin/mysqld_safe

# # COPY script.sh .

# # RUN bash script.sh
# # #  && service mysql start

# # # CMD ["bash", "-c", "/usr/bin/mysqld_safe"]

# # # CMD ["bash", "-c", "bash"]



# EXPOSE 3306

# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
# COPY ./tools /var/www/

# RUN service mysql start && mysql < /var/www/initial_db.sql && rm -f /var/www/initial_db.sql;

# CMD ["mysqld"]

# base image
# FROM debian:buster

# install mariadb server
RUN apt update && apt -y install mariadb-server

# copy the script.sh into container
COPY ./script.sh /tmp/script.sh

# change the permission to the script.sh
RUN chmod +x /tmp/script.sh

# run the script.sh
ENTRYPOINT [ "/tmp/script.sh" ]

# running mysqld daemon
CMD [ "mysqld" ]