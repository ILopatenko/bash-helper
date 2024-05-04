#!/bin/bash


updateUpgradeSystemCommand(){
   sudo apt update && sudo apt upgrade -y
}

installInitialServerSoftCommand(){
   updateUpgradeSystemCommand
   sudo apt install git nano htop openssh-server nfs-common wget iperf3 -y
}

installNodejsCommand(){
   updateUpgradeSystemCommand
   sudo curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt-get install -y nodejs -y
}

installDockerStackCommand(){
   updateUpgradeSystemCommand
   wget https://gitlab.com/bmcgonag/docker_installs/-/raw/main/install_docker_nproxyman.sh
   chmod +x ./install_docker_nproxyman.sh
   ./install_docker_nproxyman.sh
   rm ./install_docker_nproxyman.sh
}

installDockerCommand(){
   updateUpgradeSystemCommand
   curl -L https://get.docker.com | sh
   sudo usermod -aG docker $USER && sudo reboot
}


#DESKTOP MENU
installInitialDesktopSoftCommand(){
   installInitialServerSoftCommand
   sudo apt install audacious qbittorrent -y
}

installBigSoft(){
   #VSCODE
   sudo apt-get install wget gpg && wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg && echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null && rm -f packages.microsoft.gpg && sudo apt install apt-transport-https && sudo apt update && sudo apt install code -y

   #CHROME
   wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
   sudo dpkg -i google-chrome-stable_current_amd64.deb
   sudo apt install -f
   rm google-chrome-stable_current_amd64.deb

   #SLACK
   wget https://downloads.slack-edge.com/desktop-releases/linux/x64/4.37.101/slack-desktop-4.37.101-amd64.deb
   sudo dpkg -i slack-desktop-4.37.101-amd64.deb
   sudo apt install -f
   rm slack-desktop-4.37.101-amd64.deb

   #NODEJS
   sudo curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt-get install -y nodejs

   #ZOOM
   wget https://zoom.us/client/5.15.3.4839/zoom_amd64.deb
   sudo dpkg -i zoom_amd64.deb
   sudo apt install -f
   rm zoom_amd64.deb

   updateUpgradeSystemCommand
}