#!/bin/bash


# полный путь до скрипта
ABSOLUTE_FILENAME=`readlink -e "$0"`
# каталог в котором лежит скрипт
DIRECTORY=`dirname "$ABSOLUTE_FILENAME"`
NAME=${PWD##*/}
OLD_PORT=`cat "$DIRECTORY/../port.txt"`
PORT=$(echo "$OLD_PORT+1" | bc)



echo $DIRECTORY
sudo chmod -R 777 ${DIRECTORY}


echo "sudo chmod -R 777 ${DIRECTORY}"

sleep 10
