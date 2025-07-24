yum install -y docker
systemctl enable docker
systemctl start docker

cat > /home/ec2-user/docker-compose.yml <<EOF
version: '3.1'
services:
  db:
    image: mysql:8.0
    restart: always
    environment:
      MYSQL_DATABASE: wordpressdb
      MYSQL_USER: admin
      MYSQL_PASSWORD: StrongPass123!
      MYSQL_ROOT_PASSWORD: StrongPass123!
    volumes:
      - db_data:/var/lib/mysql

  wordpress:
    image: wordpress:6.5.4-php8.1-apache
    restart: always
    ports:
      - 80:80
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_NAME: wordpressdb
      WORDPRESS_DB_USER: admin
      WORDPRESS_DB_PASSWORD: StrongPass123!
    depends_on:
      - db

volumes:
  db_data:
EOF

cd /home/ec2-user
docker compose up -d
