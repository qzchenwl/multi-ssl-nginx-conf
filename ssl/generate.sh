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

mkdir $domain
cd $domain

openssl genrsa -des3 -out server.key 1024
cp server.key server.key.orig
openssl rsa -in server.key.orig -out server.key
openssl req -new -key server.key -out server.csr -subj "/C=CN/ST=MyState/L=MyCity/O=MyOrg/OU=MyUnit/CN=$domain"
openssl x509 -req -days 3650 -in server.csr -signkey server.key -out server.crt
