#!/usr/bin/bash
#CONNECT

source ./_files/helpers/questions.sh
source ./_files/helpers/actions.sh
source ./_files/helpers/colors.sh

connection(){
   ssh -o StrictHostKeyChecking=no -i $1 -t ubuntu@$2 $3
}

connectionHelper(){
   path=$1
   keyName=$(find $path -name "*.key")
   ssh -o StrictHostKeyChecking=no -i $keyName -t $2@$3 $4 
}

prepareConnection(){
   clear -x
   path="/home/$USER/Storage/ssdIT/_SSH-keys/myOracle/$1/"
   keyName=$(find $path -name "*.key")
   provideInfo "I'm going to use your key $keyName"
   chmod 400 $keyName
   serverIP=$(cat $path/ip.txt)
   provideInfo "Your Server IP is $serverIP"
   provideInfo "Trying to connect ..."
   clear -x
}

connectToOracle(){
   server=$1
   prepareConnection "$1"
   echo -e "${info}Step 1 - login as ROOT:"
   echo -e "${error}sudo -i"
   echo -e "${info}Step 2 - use this command:"
   echo -e "${error}sudo fallocate -l 2048M /root/swapfile && sudo ls -lh /root/swapfile && sudo chmod 600 /root/swapfile && sudo mkswap /root/swapfile && sudo swapon /root/swapfile && sudo echo '/root/swapfile none swap sw 0 0' >> /etc/fstab && sudo apt update && sudo apt upgrade -y && sudo apt install git && exit"
   echo -e "${info}Step 3 - clone my repo with this script:"
   echo -e "${error}git clone https://github.com/ilopatenko/bash-helper && sudo reboot${menuItem}"
   connection "$keyName" "$serverIP"
}

connectToLan(){
   echo -e "${choose}"
   lanIP="192.168.0.$(askUserInput "Enter the last part of LAN server IP: 192.168.0.")"
   connectionHelper "/home/$USER/Storage/ssdIT/_SSH-keys/lan/" $USER "$lanIP"
}