FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y nginx --no-install-recommends &&\
	apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html &&\
	mkdir -p /run/nginx && chown -R www-data:www-data /run/nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./.htpasswd /etc/nginx/.htpasswd

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
