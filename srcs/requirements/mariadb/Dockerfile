FROM debian:12

RUN apt update -y\
 && apt upgrade -y\
 && apt install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh /tmp

RUN chmod u=rwx /tmp/script.sh\
 && sh /tmp/script.sh

CMD [ "mysqld_safe" ]

