#!/bin/bash

domain=$1

if [ -z $domain ]; then
    echo "need a domain"
    exit 1
fi

if [ -e $domain ]; then
    echo "$domain already exits"
    exit 1
fi

cat > $domain << EOF
server {
    listen 443;
    server_name $domain;
    root /usr/share/nginx/html;
    index index.html index.htm;
    ssl on;
    ssl_certificate /etc/nginx/ssl/$domain/server.crt;
    ssl_certificate_key /etc/nginx/ssl/$domain/server.key;
}
EOF

