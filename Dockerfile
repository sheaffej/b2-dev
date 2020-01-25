FROM osrf/ros:melodic-desktop-full-bionic

ENV SVGA_VGPU10 0

RUN apt update \
&& apt install mesa-utils

