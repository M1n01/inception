#!/bin/bash

log_file="/var/log/mysql/setup.log"

if [ ! -d "/var/lib/mysql/mariadb" ]; then
    echo "Initializing MariaDB..." >> $log_file

    echo "Running as user: $(whoami)" >> $log_file

    mysql_install_db --defaults-file=/etc/mysql/mariadb.conf.d/50-server.cnf >> $log_file 2>&1
    if [ $? -eq 0 ]; then
        echo "Database installed successfully." >> $log_file
    else
        echo "Failed to install database." >> $log_file
    fi

    mysqld --bootstrap << EOF >> $log_file 2>&1
        CREATE DATABASE IF NOT EXISTS $DB_NAME;
        CREATE USER 'wordpress'@'%' IDENTIFIED BY 'password';
        ALTER USER 'root'@'%' IDENTIFIED BY '$DB_ROOT_PASSWORD';
        GRANT ALL PRIVILEGES ON $DB_NAME.* TO 'wordpress'@'%';
        FLUSH PRIVILEGES;
EOF
    if [ $? -eq 0 ]; then
        echo "Database configured successfully." >> $log_file
    else
        echo "Failed to configure database." >> $log_file
    fi
fi

mysqld_safe >> $log_file 2>&1