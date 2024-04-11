FROM debian:bullseye-slim

RUN apt update && apt install -y nginx openssl --no-install-recommends

RUN mkdir -p /etc/nginx/ssl && \
	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/nginx.crt \
	-keyout /etc/nginx/ssl/nginx.key \
	-subj "/C=${COUNTRY}/ST=${STATE}/L=${CITY}/O=${ORGANIZATION}/OU=${ORGANIZATION_UNIT}/CN=${DOMAIN}"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN rm -rf /var/lib/apt/lists/*

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
