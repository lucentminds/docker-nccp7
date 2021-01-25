#!/bin/bash

# Update nginx to match worker_processes to no. of cpu's
procs=$(cat /proc/cpuinfo | grep processor | wc -l)
sed -i -e "s/worker_processes  1/worker_processes $procs/" /etc/nginx/nginx.conf

sed -i -e "s/\*\*CERTBOT_WILDCARD_DOMAIN\*\*/${CERTBOT_WILDCARD_DOMAIN}/" /etc/nginx/conf.d/default.conf
sed -i -e "s/\*\*CLOUDFLARE_ACCOUNT_EMAIL\*\*/${CLOUDFLARE_ACCOUNT_EMAIL}/" /root/cloudflare-api-credentials.ini
sed -i -e "s/\*\*CLOUDFLARE_API_KEY\*\*/${CLOUDFLARE_API_KEY}/" /root/cloudflare-api-credentials.ini

echo "root:${ROOT_LOGIN_PASSWORD}" | chpasswd

echo "Aquiring letsencrypt certificate for *.${CERTBOT_WILDCARD_DOMAIN}...";
certbot certonly --non-interactive --agree-tos -m ${CERTBOT_ACCOUNT_EMAIL} \
   --dns-cloudflare \
   --dns-cloudflare-credentials /root/cloudflare-api-credentials.ini \
   -d ${CERTBOT_WILDCARD_DOMAIN} -d *.${CERTBOT_WILDCARD_DOMAIN}

# Always chown webroot for better mounting
chown -Rf nginx.nginx /usr/share/nginx/html

# Start supervisord and services
/usr/local/bin/supervisord -n -c /etc/supervisord.conf
