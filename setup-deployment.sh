#!/bin/bash


read -p 'Database password: ' db_password
echo "Password entered: $db_password"

echo "Updating database password variable"
sed -i 's/#{db_password}/'"${db_password}"'/g' polisServerContainer/.env_dev
sed -i 's/#{db_password}/'"${db_password}"'/g' docker-compose.yml
