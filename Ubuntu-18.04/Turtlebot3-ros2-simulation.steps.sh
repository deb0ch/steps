
sudo apt -y update && sudo apt -y upgrade

# Install ROS 2
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
sudo apt -y update 
sudo apt -y install curl gnupg2 lsb-release
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'
sudo apt -y update
sudo apt -y install ros-dashing-desktop
sudo apt -y install python3-argcomplete  # auto-completion for ros2 CLI
echo "dashing" >> ~/.rosversion
echo 'source /opt/ros/$(cat ~/.rosversion)/setup.bash' >> ~/.bashrc
sudo apt -y install python3-colcon-common-extensions

# Install Gazebo
curl -sSL http://get.gazebosim.org | sh
sudo apt -y remove gazebo11
sudo apt -y autoremove
sudo apt -y install ros-dashing-gazebo-ros-pkgs 

# Install cartographer
sudo apt -y install google-mock  libceres-dev  liblua5.3-dev  libboost-dev  libboost-iostreams-dev  libprotobuf-dev  protobuf-compiler  libcairo2-dev  libpcl-dev  python3-sphinx
sudo apt -y install ros-dashing-cartographer ros-dashing-cartographer-ros ros-dashing-navigation2 ros-dashing-nav2-bringup

# Install Turtlebot3
sudo apt -y install python3-vcstool git
mkdir -p ~/turtlebot3_ws/src
cd ~/turtlebot3_ws && wget https://raw.githubusercontent.com/ROBOTIS-GIT/turtlebot3/ros2/turtlebot3.repos
cd ~/turtlebot3_ws && vcs import src < turtlebot3.repos
cd ~/turtlebot3_ws && colcon build --symlink-install

echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc
echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc
echo 'export TURTLEBOT3_MODEL=waffle' >> ~/.bashrc
echo 'export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/turtlebot3_ws/src/turtlebot3/turtlebot3_simulations/turtlebot3_gazebo/models' >> ~/.bashrc
