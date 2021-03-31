#!/bin/bash


# полный путь до скрипта
ABSOLUTE_FILENAME=`readlink -e "$0"`
# каталог в котором лежит скрипт
DIRECTORY=`dirname "$ABSOLUTE_FILENAME"`
NAME=${PWD##*/}

PORTHTTP=`cat "$DIRECTORY/http-port.txt"`
PORTHTTPS=`cat "$DIRECTORY/https-port.txt"`
PORTSSH=`cat "$DIRECTORY/ssh-port.txt"`
PORTDB=`cat "$DIRECTORY/db-port.txt"`



if [ -n "$PORTHTTP" ]; then
    PORTHTTPFORDOCKER="-p $PORTHTTP:80"
else
    PORTHTTPFORDOCKER=" "
fi

if [ -n "$PORTHTTPS" ]; then
    PORTHTTPSFORDOCKER="-p $PORTHTTPS:443"
else
    PORTHTTPSFORDOCKER=" "
fi

if [ -n "$PORTSSH" ]; then
    PORTSSHFORDOCKER="-p $PORTSSH:22"
else
    PORTSSHFORDOCKER=" "
fi


if [ -n "$PORTDB" ]; then
    FORDOCKER="-p $PORTDB:3306"
else
    FORDOCKER=" "
fi


echo $PORTHTTPFORDOCKER
echo $PORTHTTPSFORDOCKER
echo $PORTSSHFORDOCKER
echo $FORDOCKER
sudo chmod -R 777 $DIRECTORY/lamp-mariadb $DIRECTORY/lamp-apache-conf $DIRECTORY/lamp-mariadb-conf/debian-start
sudo docker run -d -it $PORTHTTPFORDOCKER $PORTHTTPSFORDOCKER $PORTSSHFORDOCKER $FORDOCKER --name $NAME -v $DIRECTORY/lamp-mariadb:/var/lib/mysql -v $DIRECTORY/lamp-docroot:/var/www/html -v $DIRECTORY/lamp-apache-conf:/etc/apache2 -v $DIRECTORY/lamp-mariadb-conf:/etc/mysql  palachorel/lamp7.4_git_cron_ssh_composer /bin/bash -c "service apache2 start && service cron start && service mariadb start && /bin/bash"

sudo chmod -R 777 $DIRECTORY/lamp-docroot
echo "docker run -d -it $PORTHTTPFORDOCKER $PORTHTTPSFORDOCKER $PORTSSHFORDOCKER $FORDOCKER --name $NAME -v $DIRECTORY/lamp-mariadb:/var/lib/mysql -v $DIRECTORY/lamp-docroot:/var/www/html -v $DIRECTORY/lamp-apache-conf:/etc/apache2 -v $DIRECTORY/lamp-mariadb-conf:/etc/mysql  palachorel/lamp7.4_git_cron_ssh_composer"
echo "docker exec -it $NAME bash"
sleep 10
