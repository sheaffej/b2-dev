#!/usr/bin/env bash
MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Restarting ROS Master"
ssh docker-server docker restart rosmaster

echo "Setting /use_sim_time = true"
${MYDIR}/run/dev_cmd.sh rosparam set /use_sim_time true



# echo "Starting base nodes"
# ssh b2 '~/project/b2-base/run/base_nodes.sh'
# # ssh b2 '~/project/ros-realsense/laserscan.sh'

# echo "Starting dev tools"
# source $MYDIR/dev_cmd.sh roslaunch b2_dev display.launch
