#!/usr/bin/bash
#ACTIONS

source ./_files/helpers/colors.sh



updateUpgrade(){
   sudo apt update && sudo apt upgrade -y
   sleep 0.5
   echo -e "${successAction}OK. The task to update and upgrade your system was done!"
   sleep 1.5
}


connectToServer(){
   echo -e "${serverOutput}"
   ssh -t -i -o StrictHostKeyChecking=no $1@$2 $3
}

connectToProxmoxFirst(){
   echo -e "${serverOutput}"
   command='sudo apt update && sudo apt upgrade -y && sudo apt install git && git clone https://github.com/ilopatenko/bash-helper && sudo reboot'
   connectToServer "test" "$1" "$command"
}

connectOracle(){
   path="/home/$USER/Storage/ssdIT/_SSH-keys/myOracle/$1/"
   keyName=$(find $path -name "*.key")
   chmod 400 $keyName
   serverIP=$(cat $path/ip.txt)
   clear -x
   echo -e "${faultAction}If it is your first connection please create a SWAP, and other funny things using this command:"
   echo -e "sudo -i"
   echo -e "fallocate -l 2048M /root/swapfile && ls -lh /root/swapfile && chmod 600 /root/swapfile && mkswap /root/swapfile && swapon /root/swapfile && echo '/root/swapfile none swap sw 0 0' >> /etc/fstab && apt update && apt upgrade -y && apt install git -y && exit"
   echo -e "git clone https://github.com/ilopatenko/bash-helper && sudo reboot"
   echo -e "${serverOutput}"
   sleep 2
   ssh -o StrictHostKeyChecking=no -i $keyName ubuntu@$serverIP
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


generalTools(){
   sudo apt install openssh-server git nano wget tar htop nfs-common p7zip-full gpg -y
   finished
}

dockerStack(){
   wget https://gitlab.com/bmcgonag/docker_installs/-/raw/main/install_docker_nproxyman.sh
   chmod +X install_docker_nproxyman.sh
   bash install_docker_nproxyman.sh
}


netmakerServer(){
   sudo wget -qO /root/nm-quick-interactive.sh https://raw.githubusercontent.com/gravitl/netmaker/master/scripts/nm-quick-interactive.sh && sudo chmod +x /root/nm-quick-interactive.sh && sudo /root/nm-quick-interactive.sh
}

netmakerClient(){
   sudo curl -sL 'https://apt.netmaker.org/gpg.key' | sudo tee /etc/apt/trusted.gpg.d/netclient.asc
   sudo curl -sL 'https://apt.netmaker.org/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/netclient.list
   sudo apt update
   sudo sudo apt install netclient -y
   sudo ip -br -c a
}

updateUpgradeSilent(){
   updateUpgrade &> /dev/null
   finished
}


exitIfRoot(){
   if [[ $USER == "root" ]]; then
   echo -e "${error}Please run this script as non root user!"
   echo -e "${info}bash $0"
   exit
   else currentUser=$USER
   fi
}


#LOCAL DISKS
#2TER, 860, 970-rest

checkFolderStorage(){
   exitIfRoot
   if [ -d "/home/$USER/Storage" ]; then
      echo -e "${info} folder /home/$USER/Storage exists!"
   else
      echo -e "${info} trying to create /home/$USER/Storage"
      mkdir "/home/$USER/Storage"
      if [ -d "/home/$USER/Storage" ]; then
         echo -e "${done} folder /home/$USER/Storage was created!"
      else
         echo -e "${error} can not create folder /home/$USER/Storage!" 
      fi
   fi
}

createFolderForMount(){
   if [ -d "/home/$USER/Storage/$1" ]; then
   echo -e "${info} folder /home/$USER/Storage/$1 exists!"
   else
   echo -e "${info} trying to create /home/$USER/Storage/$1"
      mkdir "/home/$USER/Storage/$1"
      if [ -d "/home/$USER/Storage/$1" ]; then
         echo -e "${done} folder /home/$USER/Storage/$1 was created!"
      else
         echo -e "${error} can not create folder /home/$USER/Storage/$1!" 
      fi
   fi

}

localDisks(){
   checkFolderStorage
   createFolderForMount "2TER"
   createFolderForMount "860"
   createFolderForMount "970-rest"
   sudo bash ./_files/helpers/fstab.sh $currentUser "local"
}

lanNFSAll(){
   checkFolderStorage
   createFolderForMount "ryzen2ter"
   createFolderForMount "ryzen4ter"
   createFolderForMount "ssdIT"
   createFolderForMount "ssdMedia"
   sudo bash ./_files/helpers/fstab.sh $currentUser "lanNFSAll"
}

lanNFSryzen2ter(){
   checkFolderStorage
   createFolderForMount "ryzen2ter"
   sudo bash ./_files/helpers/fstab.sh $currentUser "ryzen2ter"
}

allTheStorages(){
   checkFolderStorage
   createFolderForMount "2TER"
   createFolderForMount "860"
   createFolderForMount "970-rest"
   createFolderForMount "ryzen2ter"
   createFolderForMount "ryzen4ter"
   createFolderForMount "ssdIT"
   createFolderForMount "ssdMedia"
   sudo bash ./_files/helpers/fstab.sh $currentUser "all"
}

evgaZ15(){
  sudo add-apt-repository ppa:thopiekar/openrgb -y && sudo apt update && sudo apt install openrgb -y
}

nodejsInstall(){
   sudo curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt-get install -y nodejs
}