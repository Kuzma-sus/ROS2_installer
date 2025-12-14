#!/bin/bash

# --- 1. Установка локалей ---
sudo apt update && sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# --- 2. Добавление репозитория ROS 2 ---
sudo apt update && sudo apt install curl gnupg2 lsb-release -y
sudo apt install software-properties-common -y
sudo add-apt-repository universe -y
sudo curl -sSL raw.githubusercontent.com -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# --- 3. Установка ROS 2 Jazzy ---
sudo apt update -y
sudo apt install ros-jazzy-desktop -y
sudo apt install ros-dev-tools -y
sudo apt install ros-jazzy-ros-base -y

# --- 4. Настройка окружения ---
echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc
source ~/.bashrc

# --- 5. Создание виртуального окружения Python ---
sudo apt install python3 -y
sudo apt install python3.12-venv -y
python3 -m venv ros2
source ros2/bin/activate -y

# --- 6. Установка инструментов сборки Python ---
sudo apt install python3-pip -y
pip3 install setuptools --break-system-packages
sudo apt install python3-colcon-common-extensions -y

# --- 7. Проверка ---
echo "Переменная ROS_DISTRO:"
echo $ROS_DISTRO
