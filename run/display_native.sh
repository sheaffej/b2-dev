#!/usr/bin/env bash

# DOCKER_IMAGE="sheaffej/b2-dev"
# CONTAINER_NAME="display"
# LABEL="b2"

# MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# PROJ_DIR=$MYDIR/../..  # Directory containing the cloned git repos

# docker run -d --rm \
# --name ${CONTAINER_NAME} \
# --label ${LABEL} \
# --net host \
# --privileged \
# --env DISPLAY \
# --env ROS_MASTER_URI \
# --mount type=bind,source=$PROJ_DIR,target=/root/b2_project \
# --mount type=bind,source=$HOME/Downloads,target=/root/Downloads \
# -v /tmp/.X11-unix:/tmp/.X11-unix \
# ${DOCKER_IMAGE} roslaunch b2_dev display.launch

roslaunch b2_dev display.launch