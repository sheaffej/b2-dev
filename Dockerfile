FROM osrf/ros:melodic-desktop-full-bionic

SHELL [ "bash", "-c"]
WORKDIR /root

ENV ROS_WS /ros
ENV SVGA_VGPU10 0

RUN apt update \
&& apt install -y \
    mesa-utils \
    ros-melodic-joy

RUN echo '#!/bin/bash' > /entrypoint.sh \
&& echo 'source "/opt/ros/$ROS_DISTRO/setup.bash"' >> /entrypoint.sh \
&& echo 'source "${ROS_WS}/devel/setup.bash"' >> /entrypoint.sh \
&& echo 'exec "$@"' >> /entrypoint.sh \
&& chmod 700 /entrypoint.sh \
&& echo "source /entrypoint.sh" >> /root/.bashrc \
&& echo "source /root/.bashrc" >> /root/.bash_profile

RUN mkdir -p ${ROS_WS}/src

# RUN cd ${ROS_WS}/src \
# && git clone https://github.com/googlecartographer/cartographer_ros.git \
# && cd cartographer_ros \
# && git checkout tags/1.0.0
# && rm -Rf cartographer_ros
# && mv cartographer_ros_msgs ${ROS_WS}/src/ \
# && mv cartographer_rviz ${ROS_WS}/src/

RUN mkdir -p /root/b2_project \
&& cd /root/b2_project \
&& git clone https://github.com/sheaffej/b2-dev.git \
&& ln -s /root/b2_project/b2-dev/b2_dev ${ROS_WS}/src/b2_dev \
&& git clone https://github.com/sheaffej/b2_description.git \
&& ln -s /root/b2_project/b2_description ${ROS_WS}/src/b2_description

RUN source "/opt/ros/$ROS_DISTRO/setup.bash" \
&& cd ${ROS_WS}/src \
&& catkin_init_workspace \
&& cd ${ROS_WS} \
&& catkin_make

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "bash" ]
