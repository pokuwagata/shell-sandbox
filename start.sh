#!/bin/bash

if [ $# -eq 0 ]; then
  echo 'docker image name is required'
else
  docker run -it -v $(pwd)/work:/root/work $1
fi
