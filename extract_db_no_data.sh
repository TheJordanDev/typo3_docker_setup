#!/bin/bash

# List the docker containers
docker ps

read -p "Enter the name of the database container: " container
read -p "Enter the name of the database: " database
read -p "Enter the login of the database: " login
read -s -p "Enter the password of the database: " password
echo

docker exec $container bash -c "mysqldump -u $login -p$password --no-data $database > /schema.sql"

container_pwd=$(docker exec $container pwd)

docker cp $container:$container_pwd/schema.sql .
