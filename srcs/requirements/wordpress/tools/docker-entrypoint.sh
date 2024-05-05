#!/bin/bash

if ! wp core is-installed --allow-root --path=/var/www/html ; then

    wp core download --allow-root --path=/var/www/html --locale=ja

    echo "...Create wp-config.php"

    wp config create \
        --allow-root \
        --path=/var/www/html \
        --locale=ja \
        --dbname=${DB_NAME} \
        --dbuser=${DB_USER} \
        --dbpass=${DB_PASSWORD} \
        --dbhost="mariadb"

    echo "...Install WordPress"

    wp core install \
        --allow-root \
        --path=/var/www/html \
        --locale=ja \
        --url=${WP_URL} \
        --title=${WP_TITLE} \
        --admin_user=${WP_ADMIN_USER} \
        --admin_email=${WP_ADMIN_EMAIL} \
        --admin_password=${WP_ADMIN_PASSWORD}

    wp user create \
        --allow-root \
        --path=/var/www/html \
        ${WP_EDITOR_USER} \
        ${WP_EDITOR_EMAIL} \
        --user_pass=${WP_EDITOR_PASSWORD}
        --role=editor \
fi

php-fpm7.4 -F
