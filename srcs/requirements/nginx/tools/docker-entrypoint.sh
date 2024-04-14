#!/bin/bash

if [ ! -f "$CERT_DIR/$CERT_NAME.crt" ]; then
	SUBJ="/C=$COUNTRY/ST=$STATE/O=$ORGANIZATION/CN=$DOMAIN_NAME"

	openssl genrsa -out $CERT_DIR/$CERT_NAME.key "$RSA_KEY_SIZE"
	if [ $? -ne 0 ]; then
        echo "RSA鍵の生成に失敗しました。"
        exit 1
    fi

	openssl req -new -key $CERT_DIR/$CERT_NAME.key -out $CERT_DIR/$CERT_NAME.csr -subj "$SUBJ"
	if [ $? -ne 0 ]; then
        echo "CSRの生成に失敗しました。"
        exit 1
    fi

	openssl x509 -req -days 365 -in $CERT_DIR/$CERT_NAME.csr -signkey $CERT_DIR/$CERT_NAME.key -out $CERT_DIR/$CERT_NAME.crt
	if [ $? -ne 0 ]; then
        echo "自己署名SSL証明書の生成に失敗しました。"
        exit 1
    fi

	chmod 600 $CERT_DIR/$CERT_NAME.key
	chmod 644 $CERT_DIR/$CERT_NAME.crt
fi

exec nginx -g 'daemon off;'
