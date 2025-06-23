# legoloam_ws

# **Struktur Direktori**
~/legoloam_ws/
├── docker/
│   ├── Dockerfile
│   ├── docker-compose.yml
│   ├── build.sh
│   └── run.sh
└── src/
    └── LeGO-LOAM/       ← hasil clone dari GitHub
    └── bags/            ← tempat menyimpan file .bag

Modular: The docker/ directory stores the container configuration, separate from the source code (src/).

Flexible: The .bag files and source code can be edited directly from the host, and will automatically be reflected in the container because they are mounted as volumes.

Reproducible: This structure is suitable for collaboration and cross-machine deployment because the setup is consistent.

Lengkah - Langkah 

**Langkah 1 : Setup Clone Repo**
Clone repository yang sudah saya sediakan
Baca file .txt pada folder src dan bags

**Langkah 2 : Perizinan Akses**
Masuk ke dalam folder docker dengan menggunakan terminal ubuntu anda (bukan docker)

cd ~/legoloam_ws/docker
xhost +local:root
chmod +x build.sh run.sh

**Langkah 3 : Build & Run Docker**
Gunakan terminal ubuntu anda

cd ~/legoloam_ws/docker
./build.sh
./run.sh

**Langkah 4 : Build Workspace Container**
Gunakan terminal docker anda

Perhatian gunakan 2 terminal docker pada kasus ini
Terminal Docker 1  :
cd ~/legoloam_ws
source /opt/ros/melodic/setup.bash
catkin_make
chmod +x devel/lib/lego_loam/*
source devel/setup.bash
roslaunch lego_loam run.launch

Terminal Docker 2  :
rosparam set use_sim_time true
rosbag play /root/legoloam_ws/bags/2017-06-08-15-52-45_3.bag --clock
atau
rosbag play /root/legoloam_ws/bags/same_position.bag --clock


