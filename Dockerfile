FROM osrf/ros:melodic-desktop-full

RUN apt-get update && apt-get install -y \
      ros-melodic-navigation \
      ros-melodic-teb-local-planner \
      libceres-dev \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /catkin_ws/src \
 && cd /catkin_ws/src \
 && git clone https://github.com/NKU-MobFly-Robotics/p3dx.git
 
COPY . /catkin_ws/src/.

RUN . /opt/ros/$ROS_DISTRO/setup.sh \
 && cd /catkin_ws \
 && catkin_make

RUN sed --in-place --expression \
      '$isource "/catkin_ws/devel/setup.bash"' \
      /ros_entrypoint.sh

CMD ["roslaunch", "move_base_benchmark", "move_base_benchmark.launch"]
