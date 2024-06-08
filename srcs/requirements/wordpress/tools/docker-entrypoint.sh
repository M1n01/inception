#!/bin/bash

# Check if wp-config.php exists, if not create it and install WordPress
if ! su -s /bin/bash www-data -c "wp core is-installed --path=/var/www/html"; then
    echo "Downloading WordPress core files..."
    su -s /bin/bash www-data -c "wp core download --path=/var/www/html --locale=ja"

    echo "Creating wp-config.php..."
    su -s /bin/bash www-data -c "wp config create --path=/var/www/html --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=mariadb"

    echo "Installing WordPress..."
    su -s /bin/bash www-data -c "wp core install --path=/var/www/html --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}"

    echo "Creating Editor User..."
    su -s /bin/bash www-data -c "wp user create --path=/var/www/html ${WP_EDITOR_USER} ${WP_EDITOR_EMAIL} --user_pass=${WP_EDITOR_PASSWORD} --role=editor"
fi

# Start php-fpm
php-fpm7.4 -F
