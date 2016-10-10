server {
    listen 443;
    server_name example.com;
    root /usr/share/nginx/html;
    index index.html index.htm;
    ssl on;
    ssl_certificate /etc/nginx/ssl/example.com/server.crt;
    ssl_certificate_key /etc/nginx/ssl/example.com/server.key;
}
