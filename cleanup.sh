#!/bin/bash

# Stop all containers
docker ps
docker stop nginx_guacamole_compose
docker stop guacamole_compose
docker stop guacd_compose
docker stop postgres_guacamole_compose
docker ps

# Remove all containers
docker rm nginx_guacamole_compose
docker rm guacamole_compose
docker rm guacd_compose
docker rm postgres_guacamole_compose
docker ps -a

docker network rm easy-guac_guacnetwork_compose

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
fi
echo "done"
