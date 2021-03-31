#!/bin/bash

NAME=${PWD##*/}
docker start ${NAME}
echo "docker stop ${NAME}"
sleep 5
