#!/bin/bash

if [ ! -d "/var/lib/mysql/mariadb" ]; then
    mysql_install_db --defaults-file=/etc/mysql/mariadb.conf.d/50-server.cnf
    mysqld --bootstrap << EOF
        FLUSH PRIVILEGES;
        CREATE DATABASE IF NOT EXISTS $DB_NAME;
        CREATE USER '$DB_USER'@'%' IDENTIFIED BY $DB_PASSWORD;
        ALTER USER 'root'@'%' IDENTIFIED BY $DB_ROOT_PASSWORD;
        GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '$DB_USER'@'%' BY '$DB_PASSWORD';
EOF
fi

# mysqldデーモンを起動し、クライアンアントからの接続を受け付け、データベースへのアクセスを提供
mysqld_safe
