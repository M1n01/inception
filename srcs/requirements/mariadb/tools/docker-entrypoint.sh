#!/bin/bash

if [ ! -d "${MYSQL_DATA_PATH}/mysql" ]; then
	mysql_install_db
	mysqld --bootstrap << EOF
		FLUSH PRIVILEGES;
		ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
		CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
		CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
		GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%';
EOF
fi

exec mysqld --datadir=/var/lib/mysql --user=mysql
