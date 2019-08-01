#!/bin/bash

echo Override config
mkdir -p /tmp/override
cp /override/* /tmp/override -rf
chown root:root -R /tmp/override
cp /tmp/override/* / -rf

chmod 400 /etc/pki/tls/certs/bundle.crt
chmod 400 /etc/pki/tls/private/private.key

echo Start nginx
nginx -g "daemon off;"