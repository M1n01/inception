FROM debian:bullseye-slim

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends mariadb-server mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

RUN set -x \
	&& mkdir /run/mysqld \
	&& chown mysql:mysql /run/mysqld \
	&& mkdir /docker-entrypoint-initdb.d \
	&& ln -sf /dev/stderr /var/log/mysql/error.log

ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
	MYSQL_DATABASE=${MYSQL_DATABASE} \
	MYSQL_USER=${MYSQL_USER} \
	MYSQL_PASSWORD=${MYSQL_PASSWORD}

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

CMD ["/usr/local/bin/start.sh"]
