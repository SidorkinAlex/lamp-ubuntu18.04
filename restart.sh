#!/bin/bash

NAME=${PWD##*/}
docker start ${NAME}
echo "docker restart ${NAME}"
sleep 5
