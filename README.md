# Multiple SSL Certificates on a Single IP Using Nginx

# Usage

## Start server

```
you@host$ docker run -it -p 80:80 -p 443:443 \
           -v $PWD/nginx.conf:/etc/nginx/nginx.conf \
           -v $PWD/ssl:/etc/nginx/ssl \
           -v $PWD/sites-available:/etc/nginx/sites-available \
           -v $PWD/sites-enabled:/etc/nginx/sites-enabled \
           nginx bash

root@docker# service nginx restart
```

## Generate certificate

```
you@host$ cd ssl
you@host$ ./generate.sh <your-hostname>
```

## Example virtual host file

```conf
server {
listen 443;
server_name example.com;
root /usr/share/nginx/www;
index index.html index.htm;
ssl on;
ssl_certificate /etc/nginx/ssl/example.com/server.crt;
ssl_certificate_key /etc/nginx/ssl/example.com/server.key;
}
```

# Reference

[Multiple SSL Certificates on a Single IP Using Nginx](http://www.supportpro.com/blog/multiple-ssl-certificates-on-a-single-ip-using-nginx/)

