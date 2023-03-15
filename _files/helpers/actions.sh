#!/usr/bin/bash
#ACTIONS
source ./_files/helpers/questions.sh
source ./_files/helpers/fstab.sh
#source ./_files/modules/Desktop.sh



wait1(){
   sleep 1
}

updateUpgrade(){
   sudo apt update && sudo apt upgrade -y
   reportOK "Your OS was updated and upgraded"
}

essentialTools(){
   sudo apt install openssh-server git nano wget tar htop nfs-common gpg -y
   reportOK "All the essential tool for the server were installed"
}

desktopTools(){
   sudo apt install openssh-server git nano wget tar htop nfs-common gpg audacious qbittorrent -y
   reportOK "All the essential tool for the desktop were installed"
}

bigSoft(){
   wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
   sudo dpkg -i google-chrome-stable_current_amd64.deb
   sudo apt install -f
   rm google-chrome-stable_current_amd64.deb

   wget https://az764295.vo.msecnd.net/stable/5e805b79fcb6ba4c2d23712967df89a089da575b/code_1.76.1-1678294265_amd64.deb
   sudo dpkg -i code_1.76.1-1678294265_amd64.deb
   sudo apt install -f
   rm code_1.76.1-1678294265_amd64.deb

   wget https://zoom.us/client/5.13.11.1288/zoom_amd64.deb
   sudo dpkg -i zoom_amd64.deb
   sudo apt install -f
   rm zoom_amd64.deb

   wget https://downloads.slack-edge.com/releases/linux/4.29.149/prod/x64/slack-desktop-4.29.149-amd64.deb
   sudo dpkg -i slack-desktop-4.29.149-amd64.deb
   sudo apt install -f
   rm slack-desktop-4.29.149-amd64.deb

   sudo curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt-get install -y nodejs

   sudo add-apt-repository ppa:thopiekar/openrgb -y && sudo apt update && sudo apt install openrgb -y
}


netmakerClient(){
   sudo curl -sL 'https://apt.netmaker.org/gpg.key' | sudo tee /etc/apt/trusted.gpg.d/netclient.asc
   sudo curl -sL 'https://apt.netmaker.org/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/netclient.list
   sudo apt update
   sudo sudo apt install netclient -y
   sudo ip -br -c a
}

netmakerServer(){
   sudo wget -qO /root/nm-quick-interactive.sh https://raw.githubusercontent.com/gravitl/netmaker/master/scripts/nm-quick-interactive.sh && sudo chmod +x /root/nm-quick-interactive.sh && sudo /root/nm-quick-interactive.sh
}

dockerStack(){
   wget https://gitlab.com/bmcgonag/docker_installs/-/raw/main/install_docker_nproxyman.sh
   chmod +X install_docker_nproxyman.sh
   bash install_docker_nproxyman.sh
   sudo rm install_docker_nproxyman.sh
}




checkIfCurrentUserIsNotRoot(){
   if [[ $(whoami) == 'root' ]]; then
      return 1
   else
      return 0
   fi
}

rootRule(){
   if checkIfCurrentUserIsRoot; then
      $1
   else
      $2
   fi
}

dockerAppsStack1(){
   mkdir -p ~/docker-apps-stack/wbo/wbo-boards
   cp ./_files/docker-apps/docker-apps-stack/x-all/docker-compose.yml ../../docker-apps-stack
   cd ../../docker-apps-stack
   sudo docker-compose up -d
}


installGitLabServer(){
  clear -x
  echo -e "${quest}"
  read -p "ENTER YOUR CUSTOM DOMAIN FOR THE GITLAB SERVER (gitlab.kitqa.com): " host
  echo -e "${info}"
  sudo apt-get update
  sudo apt-get install -y curl openssh-server ca-certificates tzdata perl
  curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo os=ubuntu dist=trusty bash
  sudo EXTERNAL_URL="$host" apt-get install gitlab-ce
}
