#!/usr/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install -y libfuse-dev libcrypto++-dev libboost-all-dev mpi-default-dev g++ cmake default-jdk g++ librdmacm-dev libssl-dev
sudo apt autoremove -y

if grep -q "^JAVA_HOME=" /etc/environment; then
    echo "JAVA_HOME is already set in /etc/environment"
else
    echo "JAVA_HOME=/usr/lib/jvm/default-java" | sudo tee -a /etc/environment >/dev/null
    echo "JAVA_HOME added to /etc/environment"
fi

source /etc/environment

rm -rf build
mkdir -p build
cd build
cmake ..
make -j
cd ..
