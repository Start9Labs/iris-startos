#!/bin/sh
set -e

echo
echo "Starting Iris ..."
echo

CONF_FILE="/etc/nginx/conf.d/default.conf"
NGINX_CONF='server {
    listen 80;
    return 301 https://$host$request_uri;
}

server {
    listen 8080;
    listen 3443 ssl;
    ssl_certificate /mnt/cert/main.cert.pem;
    ssl_certificate_key /mnt/cert/main.key.pem;

    server_name  localhost;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
}
'
echo "$NGINX_CONF" > $CONF_FILE

_term() {
  echo "Caught SIGTERM signal!"
  kill -SIGTERM "$iris_process" 2>/dev/null
}

nginx -g 'daemon off;' &
iris_process=$!

trap _term SIGTERM

wait $iris_process
