#!/bin/bash


# полный путь до скрипта
ABSOLUTE_FILENAME=`readlink -e "$0"`
# каталог в котором лежит скрипт
DIRECTORY=`dirname "$ABSOLUTE_FILENAME"`
NAME=${PWD##*/}

PORTHTTP=`cat "$DIRECTORY/http-port.txt"`
PORTSSH=`cat "$DIRECTORY/ssh-port.txt"`
PORTDB=`cat "$DIRECTORY/db-port.txt"`
PORTHTTPS=`cat "$DIRECTORY/https-port.txt"`


echo $DIRECTORY
echo $PORTHTTP
echo $NAME
docker run -d -p $PORTHTTP:80 -p $PORTHTTPS:443 -p $PORTSSH:22 -p $PORTDB:3306 --name $NAME -v $DIRECTORY/lamp-mariadb:/var/lib/mysql -v $DIRECTORY/lamp-docroot:/var/www/html -v $DIRECTORY/lamp-apache-conf:/etc/apache2 -v $DIRECTORY/lamp-mariadb-conf:/etc/mysql palachorel/lamp-ubuntu18.04


echo "docker runing $NAME PORTHTTP: $PORTHTTP"
echo "docker exec -it $NAME bash"
sleep 10
