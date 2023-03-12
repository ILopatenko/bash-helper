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

connectNFSshares(){
   checkFolderStorage
   createFolderForMount
   askYesNoQuestionWithActions "connect all the local Disks and LAN NFSs" connectAll
   askYesNoQuestionWithActions "connect all the local Disks" connectLocal
   askYesNoQuestionWithActions "connect all the NFSs" connectNFS
   askYesNoQuestionWithActions "connect only common share ryzen2ter" connectRyzen2ter
}


checkFolderStorage(){
   if [ -d "/home/$USER/Storage" ]; then
      echo -e "${info} folder /home/$USER/Storage exists!"
   else
      echo -e "${info} trying to create /home/$USER/Storage"
      mkdir "/home/$USER/Storage"
      if [ -d "/home/$USER/Storage" ]; then
         echo -e "${good} folder /home/$USER/Storage was created!"
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
         echo -e "${good} folder /home/$USER/Storage/$1 was created!"
      else
         echo -e "${error} can not create folder /home/$USER/Storage/$1!" 
      fi
   fi

}

connectLocal(){
   createFolderForMount "2TER"
   createFolderForMount "860"
   createFolderForMount "970-rest"
   sudo bash ./_files/helpers/fstab.sh $USER "local"
}

connectNFS(){
   checkFolderStorage
   createFolderForMount "ryzen2ter"
   createFolderForMount "ryzen4ter"
   createFolderForMount "ssdIT"
   createFolderForMount "ssdMedia"
   sudo bash ./_files/helpers/fstab.sh $USER "lanNFSAll"
}

connectRyzen2ter(){
   checkFolderStorage
   createFolderForMount "ryzen2ter"
   sudo bash ./_files/helpers/fstab.sh $USER "ryzen2ter"
}

connectAll(){
   checkFolderStorage
   createFolderForMount "2TER"
   createFolderForMount "860"
   createFolderForMount "970-rest"
   createFolderForMount "ryzen2ter"
   createFolderForMount "ryzen4ter"
   createFolderForMount "ssdIT"
   createFolderForMount "ssdMedia"
   sudo bash ./_files/helpers/fstab.sh $USER "all"
   return 0
}

netmakerClient(){
   sudo curl -sL 'https://apt.netmaker.org/gpg.key' | sudo tee /etc/apt/trusted.gpg.d/netclient.asc
   sudo curl -sL 'https://apt.netmaker.org/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/netclient.list
   sudo apt update
   sudo sudo apt install netclient -y
   sudo ip -br -c a
}