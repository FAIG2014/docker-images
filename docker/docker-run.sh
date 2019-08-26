#!/bin/bash
set -e


DOCKER_WORKSPACE=${DOCKER_WORKSPACE:=${HOME}/workspace}


set +e
docker run \
    -it \
    --rm \
    --net=host \
    --device=/dev/bus/usb/ \
    -e DISPLAY \
    -e SHELL \
    -e LOCAL_USER_ID=$(id -u)\
    -e LOCAL_USER_HOME=${HOME} \
    -e LOCAL_USER_NAME=${USERNAME} \
    -v ${HOME}/.Xauthority:${HOME}/.Xauthority \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -w ${PWD} \
    -v ${DOCKER_WORKSPACE}:${DOCKER_WORKSPACE} \
    -v /tmp:/tmp \
    -v ${HOME}/Downloads:${HOME}/Downloads \
    $@



