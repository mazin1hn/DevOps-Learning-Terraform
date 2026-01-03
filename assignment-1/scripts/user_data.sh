#!/bin/bash


set -e

dnf update -y
dnf install -y docker

systemctl enable docker
systemctl start docker
sleep 8

# Install docker-compose (standalone binary for AL2023)
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64" \
  -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose || true

mkdir -p /opt/wordpress
cd /opt/wordpress

cat <<'EOC' > docker-compose.yml
version: "3.8"

services:
  wordpress:
    image: wordpress:php8.4-apache
    ports:
      - "80:80"
    environment:
      WORDPRESS_DB_HOST: mysql
      WORDPRESS_DB_USER: mazin
      WORDPRESS_DB_PASSWORD: wppassword
      WORDPRESS_DB_NAME: wordpress
    depends_on:
      - mysql

  mysql:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: mysqladminpassword
      MYSQL_DATABASE: wordpress
      MYSQL_USER: mazin
      MYSQL_PASSWORD: wppassword
    volumes:
      - mysql_storage:/var/lib/mysql

volumes:
  mysql_storage:
EOC

docker-compose up -d
EOF