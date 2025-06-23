# ~/legoloam_ws/docker/Dockerfile
FROM osrf/ros:melodic-desktop-full

ENV DEBIAN_FRONTEND=noninteractive
ENV WORKSPACE=/root/legoloam_ws

# Install dependencies
RUN apt update && apt install -y \
    git \
    cmake \
    build-essential \
    libpcl-dev \
    libproj-dev \
    libgoogle-glog-dev \
    libgflags-dev \
    libeigen3-dev \
    libopencv-dev \
    libboost-all-dev \
    libtbb-dev \
    libmetis-dev \
    wget \
    unzip \
    ros-melodic-pcl-ros \
    ros-melodic-tf \
    ros-melodic-tf2 \
    ros-melodic-tf2-ros \
    ros-melodic-tf2-geometry-msgs \
    ros-melodic-cv-bridge \
    ros-melodic-image-transport \
  #  ros-melodic-rosbag \
 #   ros-melodic-velodyne-pointcloud \
#    ros-melodic-sensor-msgs \
    ros-melodic-rviz && \
    rm -rf /var/lib/apt/lists/*

# Install GTSAM
RUN mkdir -p /tmp/gtsam && \
    cd /tmp/gtsam && \
    wget -O gtsam.zip https://github.com/borglab/gtsam/archive/4.0.0-alpha2.zip && \
    unzip gtsam.zip && \
    cd gtsam-4.0.0-alpha2 && \
    mkdir build && cd build && \
    cmake .. && \
    make -j$(nproc) && \
    make install && \
    cd / && rm -rf /tmp/gtsam

# Setup ROS workspace
RUN mkdir -p ${WORKSPACE}/src
WORKDIR ${WORKSPACE}

# Copy source code
# COPY ../src/LeGO-LOAM ${WORKSPACE}/src/LeGO-LOAM

# Build workspace with catkin_make
RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && \
    cd ${WORKSPACE} && \
    catkin_make -j1"

# Source by default
RUN echo 'source /opt/ros/melodic/setup.bash && source ${WORKSPACE}/devel/setup.bash' >> ~/.bashrc

# Entrypoint for container to always source ROS
ENTRYPOINT ["/bin/bash", "-c", "source /root/.bashrc && bash"]
