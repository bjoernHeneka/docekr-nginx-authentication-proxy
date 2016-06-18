#!/bin/bash

htpasswd -bn $USERNAME $PASSWORD >> /etc/nginx/conf.d/nginx.htpasswd

REPLACE_VARS='$SERVICE_NAME:$SERVICE_PORT:$SERVICE_DESC'
envsubst "$REPLACE_VARS" < /files/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'
