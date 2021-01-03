#!/bin/bash

# get parameter from system
user=`id -un`

# start sharing xhost
xhost +local:root

# run docker
docker run --rm \
  -p 8888:8888 \
  -p 22:22 \
  --net=host \
  --ipc=host \
  --gpus all \
  --privileged \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v $HOME/.Xauthority:$docker/.Xauthority \
  -v $HOME/distributedRL_MAPF:$HOME/distributedRL_MAPF \
  -e XAUTHORITY=$home_folder/.Xauthority \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -it --name "my-primal" ${user}/primal
