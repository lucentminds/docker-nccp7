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
```
$ docker pull lucentminds/docker-nccp7:latest
```

## Running
To run the container:
```
$ sudo docker run -d lucentminds/docker-nccp7:latest
```

Default web root:
```
/usr/share/nginx/html
```
