#!/bin/bash

if ! wp core is-installed --allow-root --path=/var/www/html ; then
	wp core download --allow-root --path=/var/www/html --locale=ja
 
	sleep 5
	wp config create \
		--allow-root \
		--path=/var/www/html \
		--locale=ja \
		--dbname="wordpress" \
		--dbuser="admin" \
		--dbpass="password" \
		--dbhost="mariadb"

	sleep 3
	wp core install \
		--allow-root \
		--path=/var/www/html \
		--locale=ja \
		--url="https://localhost" \
		--title="inception" \
		--admin_user="supervisor" \
		--admin_email="supervisor@example.com" \
		--admin_password="abcd1234"

	wp user create \
		--allow-root \
		--path=/var/www/html \
		"user" \
		"user@sample.com" \
		--user_pass="abcd1234" \
		--role=author
fi

# フォアグラウンドで待機する
php-fpm7.4 -F
