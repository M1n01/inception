#!/bin/bash

chown -R www-data:www-data /run/php /var/www/html /var/www/.wp-cli

# Check if wp-config.php exists, if not create it and install WordPress
if ! wp core is-installed --allow-root --path=/var/www/html; then
    echo "Downloading WordPress core files..."
    wp core download --allow-root --path=/var/www/html --locale=ja

    echo "Creating wp-config.php..."
    wp config create --allow-root --path=/var/www/html --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=mariadb

    echo "Installing WordPress..."
    wp core install --allow-root --path=/var/www/html --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL

    echo "Creating Editor User..."
    wp user create --allow-root --path=/var/www/html $WP_EDITOR_USER $WP_EDITOR_EMAIL --user_pass=$WP_EDITOR_PASSWORD --role=author
fi

# Start php-fpm
php-fpm7.4 -F
