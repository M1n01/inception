#!/bin/bash

if [ ! -d "/var/lib/mysql/mariadb" ]; then
    mysql_install_db --defaults-file=/etc/mysql/mariadb.conf.d/50-server.cnf
    mysqld --bootstrap << EOF
        FLUSH PRIVILEGES;
        ALTER USER 'root'@'localhost' IDENTIFIED BY 'root_password';
        CREATE DATABASE IF NOT EXISTS mariadb;
        CREATE USER 'wordpress'@'%' IDENTIFIED BY 'password';
        GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'%';
EOF
fi

# mysqldデーモンを起動し、クライアンアントからの接続を受け付け、データベースへのアクセスを提供
mysqld_safe