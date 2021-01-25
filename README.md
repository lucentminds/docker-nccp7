## docker-nccp7
This is a Dockerfile to build a debian based container image running php-fpm 7.4.x, nginx, and certbot for wildcard domains using cloudflare DNS.

## Building from source
To build from source you need to clone the git repo and run docker build:
```shell
git clone https://github.com/lucentminds/docker-nccp7.git
cd docker-nccp7
docker build -t docker-nccp7 .
```

## Pulling from Docker Hub
```shell
docker pull lucentminds/docker-nccp7:latest
```

## Running
To run the container:
```shell
sudo docker run -d lucentminds/docker-nccp7:latest
```

With all options...
```shell
docker run --name nccp7 -p 9022:22 -p 9080:80 -p 9443:443 \
   --env CERTBOT_WILDCARD_DOMAIN=example.com \
   --env CERTBOT_ACCOUNT_EMAIL=user@example.com \
   --env ROOT_LOGIN_PASSWORD=PASSWORD \
   --env CLOUDFLARE_ACCOUNT_EMAIL=user@example.com \
   --env CLOUDFLARE_API_KEY=abcdef0123456789abcdef0123456789abcde \
   -d lucentminds/nccp7
```

## Misc
Default web root:
```shell
/usr/share/nginx/html
```
