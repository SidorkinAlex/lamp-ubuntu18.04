#!/bin/bash

NAME=${PWD##*/}
docker exec -it $NAME bash
