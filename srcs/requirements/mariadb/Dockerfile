FROM debian:bullseye-slim

RUN apt update && apt install -y mariadb-server --no-install-recommends && \
	rm -rf /var/lib/apt/lists/*

COPY ./tools/docker-entrypoint.sh /usr/local/bin/
COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306
