FROM debian:bullseye-slim

RUN apt update && apt install -y mariadb-server --no-install-recommends

COPY ./conf/my.cnf /etc/mysql/my.cnf

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

CMD ["mysqld", "--bind-address=0.0.0.0"]
