#!/usr/bin/env bash


MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $MYDIR/dev_cmd.sh roslaunch b2_dev display.launch

exit

DOCKER_IMAGE=sheaffej/b2-dev
ROS_MASTER_URI=http://docker-server:11311/

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_DIR=$MYDIR/../..  # Directory containing the cloned git repos

docker run -it --rm \
--privileged \
--net host \
--env DISPLAY \
--env ROS_MASTER_URI \
--mount type=bind,source=$PROJ_DIR,target=/root/b2_project \
--mount type=bind,source=/home/$USER/Downloads,target=/root/Downloads \
${DOCKER_IMAGE} roslaunch b2_dev display.launch
