## Easy-guac
Quick deployment of Apache Guacamole using Docker images.  
Based on the methods of https://github.com/boschkundendienst/guacamole-docker-compose.


## Quick start
Run the following commands:

~~~bash
git clone "https://github.com/forval13/easy-guac.git"
cd easy-guac
chmod +x ./init.sh
./init.sh
docker compose up -d
~~~

Your guacamole server should now be available at `https://server_ip:18443/`.  
The default username is `guacadmin` with password `guacadmin`.
