#!/bin/bash

if ! wp core is-installed --allow-root --path=/var/www/html ; then
	wp core download --allow-root --path=/var/www/html --locale=ja
 
	sleep 5
	wp config create \
		--allow-root \
		--path=/var/www/html \
		--locale=ja \
		--dbname="$WP_DB_NAME" \
		--dbuser="$WP_DB_USER" \
		--dbpass="$WP_DB_PASSWORD" \
		--dbhost="$WP_DB_HOST"

	sleep 3
	wp core install \
		--allow-root \
		--path=/var/www/html \
		--locale=ja \
		--url="https://$DOMAIN" \
		--title="$WP_TITLE" \
		--admin_user="$WP_ADMIN_USER" \
		--admin_password="$WP_ADMIN_PASSWORD" \
		--admin_email="$WP_ADMIN_EMAIL"

	wp user create \
		--allow-root \
		--path=/var/www/html \
		"$WP_USER" \
		"$WP_USER_EMAIL" \
		--user_pass="$WP_USER_PASSWORD" \
		--role=author
fi

# フォアグラウンドで待機する
php-fpm7.4 -F
