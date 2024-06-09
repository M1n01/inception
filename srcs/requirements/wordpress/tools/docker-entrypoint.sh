#!/bin/bash

chown -R www-data:www-data /run/php /var/www/html /var/www/.wp-cli

# Check if wp-config.php exists, if not create it and install WordPress
if ! wp core is-installed --allow-root --path=/var/www/html; then

    echo "Downloading WordPress core files..."
    sudo -u www-data -- wp core download --path=/var/www/html --locale=ja

    echo "Creating wp-config.php..."
    wp config create --path=/var/www/html --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=mariadb

    echo "Installing WordPress..."
    wp core install --path=/var/www/html --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL

    echo "Creating Editor User..."
    wp user create $WP_EDITOR_USER $WP_EDITOR_EMAIL --path=/var/www/html --user_pass=$WP_EDITOR_PASSWORD --role=author
fi

# Start php-fpm
php-fpm7.4 -F
