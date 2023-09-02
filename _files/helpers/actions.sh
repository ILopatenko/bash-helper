#!/bin/bash
# ACTIONS HELPER

updateUpgradeUbuntu(){
   clear -x
   sudo apt update && sudo apt upgrade -y
   sleep 1
}


installInitialServerSoft(){
   clear -x
   sudo apt install git nano htop openssh-server nfs-common wget iperf3 -y
   sleep 1
}

installDockerStack(){
   clear -x
   wget https://gitlab.com/bmcgonag/docker_installs/-/raw/main/install_docker_nproxyman.sh
   chmod +x ./install_docker_nproxyman.sh
   ./install_docker_nproxyman.sh
   rm ./install_docker_nproxyman.sh
   sleep 1
}



