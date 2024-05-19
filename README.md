## Easy-guac
Quick deployment of Apache Guacamole using Docker images.  
Based on the methods of https://github.com/boschkundendienst/guacamole-docker-compose.


## Quick start
Clone the GIT repository and start guacamole:

~~~bash
git clone "https://github.com/forval13/easy-guac.git"
cd guacamole-docker-compose
./prepare.sh
docker-compose up -d
~~~

Your guacamole server should now be available at `https://ip of your server:8443/`. The default username is `guacadmin` with password `guacadmin`.
