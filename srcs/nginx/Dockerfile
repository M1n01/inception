FROM debian:bullseye-slim

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends nginx curl openssl \
	&& rm -rf /var/lib/apt/lists/* \
	&& ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/nginx.crt \
	-keyout /etc/nginx/ssl/nginx.key \
	-subj "/C=${CERT_COUNTRY}/ST=${CERT_STATE}/L=${CERT_LOCATION}/O=${CERT_ORG}/OU=${CERT_ORG_UNIT}/CN=${DOMAIN_NAME}"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
