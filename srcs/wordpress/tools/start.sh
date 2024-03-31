#!/bin/sh

while ! mysqladmin ping -hmariadb --silent; do
    sleep 1
done

if [ ! -f "/var/www/html/wp-config.php" ]; then
    wp core download --allow-root
    wp config create --dbname=wordpress --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=mariadb --allow-root
    wp core install --url=https://login.42.fr --title="Inception WordPress" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASSWORD --role=author --allow-root
fi

exec php-fpm7 -F
