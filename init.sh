#!/bin/sh
#
# check if docker is running
if ! (docker ps >/dev/null 2>&1)
then
	echo "docker daemon not running, will exit here!"
	exit
fi
echo "Preparing folder init and creating ./init/initdb.sql"
mkdir ./init >/dev/null 2>&1
mkdir -p ./nginx/ssl >/dev/null 2>&1
chmod -R +x ./init
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgresql > ./init/initdb.sql
echo "done"
echo ""
echo "Creating SSL certificates"
openssl req -nodes -newkey rsa:2048 -new -x509 -keyout nginx/ssl/self-ssl.key -out nginx/ssl/self.cert -subj '/C=RU/ST=MO/L=MSK/O=Org/OU=IT/CN=www.createyourown.domain/emailAddress=docker@createyourown.domain'
echo "You can use your own certificates by placing the private key in nginx/ssl/self-ssl.key and the cert in nginx/ssl/self.cert"
echo "done"
echo ""
echo ""
echo "Check 'compose.yml' & '.env' files, then run 'docker compose up -d' command."
echo "Guacamole server will be available at https://this_server_ip:18443/. The default username is 'guacadmin' with password 'guacadmin'."
echo ""
echo ""
