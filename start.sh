#!/bin/bash

NAME=${PWD##*/}
docker start ${NAME}
echo "docker start ${NAME}"
sleep 5
