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






#FOR CONNECT MENU
connectToLanProxmoxServer(){
   clear -x
   read -p "PLEASE ENTER THE LAST PART OF THE LAN PROXMOX SERVER: 3.3.3." ip
   ssh -i /home/slon/Storage/r4ter-it/_SSH-keys/lan/slon-pm/slon-pm -o StrictHostKeyChecking=no slon@3.3.3.$ip
}

