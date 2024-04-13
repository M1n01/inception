#!/bin/bash

if [ ! -f "$CERT_DIR/$CERT_NAME.crt" ]; then
	SUBJ="/C=$COUNTRY/ST=$STATE/O=$ORGANIZATION/CN=$DOMAIN_NAME"

	openssl genrsa -out $CERT_DIR/$CERT_NAME.key "$RSA_KEY_SIZE"
	openssl req -new -key $CERT_DIR/$CERT_NAME.key -out $CERT_DIR/$CERT_NAME.csr -subj "$SUBJ"
	openssl x509 -req -days 365 -in $CERT_DIR/$CERT_NAME.csr -signkey $CERT_DIR/$CERT_NAME.key -out $CERT_DIR/$CERT_NAME.crt
fi

exec nginx -g 'daemon off;'
