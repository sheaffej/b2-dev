#!/usr/bin/env python
from __future__ import print_function
import threading
from math import pi
import time
import sys

import rospy
from geometry_msgs.msg import Twist

DEFAULT_NODE_NAME = "cmd_vel_node"

# Publishes
DEFAULT_CMD_TOPIC = "cmd_vel"

DEFAULT_PUB_HZ = 10
DEFAULT_MAX_LINEAR_SPEED = 2.0  # m/sec
DEFAULT_MAX_ANGULAR_SPEED = 2 * pi # radians/sec


if __name__ == "__main__":
    rospy.init_node(DEFAULT_NODE_NAME, log_level=rospy.DEBUG)

    # Set up the Twist publisher
    _cmd_vel_pub = rospy.Publisher(
        rospy.get_param('~cmd_vel', DEFAULT_CMD_TOPIC),
        Twist,
        queue_size=1
    )

    # Give subscribers time to connect
    time.sleep(1)

    # Send command
    x_speed = float(sys.argv[1])
    z_speed = float(sys.argv[2])
    secs = float(sys.argv[3])

    cmd = Twist()
    cmd.linear.x = x_speed
    cmd.angular.z = z_speed
    _cmd_vel_pub.publish(cmd)
    rospy.loginfo("Pub X:{} Z:{} for {} secs".format(x_speed, z_speed, secs))

    time.sleep(secs)

    # Stop
    x_speed = 0.0
    z_speed = 0.0

    cmd = Twist()
    cmd.linear.x = x_speed
    cmd.angular.z = z_speed
    _cmd_vel_pub.publish(cmd)
    rospy.loginfo("Pub X:{} Z:{} for {} secs".format(x_speed, z_speed, secs))
