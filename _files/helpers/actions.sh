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