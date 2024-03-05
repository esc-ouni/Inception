FROM debian:12

RUN apt update -y\
 && apt upgrade -y\
 && apt install netcat-traditional -y\
 && apt install mariadb-server -y

# COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh /tmp

RUN chmod u=rwx /tmp/script.sh
#  && sh /tmp/script.sh

EXPOSE 3306 

CMD [ "sh", "/tmp/script.sh" ]
