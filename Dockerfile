FROM osrf/ros:melodic-desktop-full

RUN apt-get update && apt-get install -y \
      ros-melodic-navigation \
      ros-melodic-teb-local-planner \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /catkin_ws/src \
 && cd ~/catkin_ws/src \
 && git clone https://github.com/NKU-MobFly-Robotics/p3dx.git \
 && git clone https://github.com/NKU-MobFly-Robotics/local-planning-benchmark.git

RUN cd /catkin_ws \
 && catkin_make

