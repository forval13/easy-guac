#!/bin/bash

# Stop all containers
echo "docker ps"
docker ps
echo ""
echo "This will stop all '*_srv' containers."
read -p "Are you sure? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
docker stop nginx_srv
docker stop guacamole_srv
docker stop guacd_srv
docker stop postgres_srv
docker ps
echo ""
fi

# Remove all containers
echo "docker ps -a"
docker ps -a
echo ""
echo "This will remove all '*_srv' containers."
read -p "Are you sure? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
docker rm nginx_srv
docker rm guacamole_srv
docker rm guacd_srv
docker rm postgres_srv
docker ps -a
echo ""
fi

# Remove network
echo "docker network ls"
docker network ls
echo ""
echo "This will remove 'guacnetwork_srv' networks."
read -p "Are you sure? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
docker network rm guacnetwork_srv
echo ""
fi

# Delete persistent data
echo "This will delete your existing database (./data/)"
echo "          delete your recordings        (./record/)"
echo "          delete your drive files       (./drive/)"
echo "          delete your certs files       (./nginx/ssl/)"
echo ""
read -p "Are you sure? " -n 1 -r
echo ""   # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]; then # do dangerous stuff
 chmod -R +x -- ./init
 sudo rm -r -f ./data/ ./drive/ ./record/ ./nginx/ssl/
 echo ""
fi
echo "done"
echo ""
