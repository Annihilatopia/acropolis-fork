#!/bin/bash

docker-compose down
docker-compose rm

sudo rm -rf polisServerContainer/polisServer
sudo rm -rf polisClientAdminContainer/polisClientAdmin
sudo rm -rf polisClientContainer/polisClient
git clone https://github.com/micovi/polisServer.git polisServerContainer/polisServer
git clone https://github.com/micovi/polisClientAdmin.git polisClientAdminContainer/polisClientAdmin
git clone https://github.com/micovi/polisClient.git polisClientContainer/polisClient

docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml up -d
