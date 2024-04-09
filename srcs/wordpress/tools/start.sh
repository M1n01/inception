#!/bin/bash

while ! mysqladmin ping -hmariadb --silent; do
    sleep 1
done

if [ ! -f "/var/www/html/wp-config.php" ]; then
    wp --allow-root core download
    wp --allow-root config create --dbname=$MYSQL_DATABASE --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=mariadb
    wp --allow-root core install --url=https://minabe.42.fr --title="Inception WordPress" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email
    wp --allow-root user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASSWORD --role=author
fi

exec php-fpm7.4
