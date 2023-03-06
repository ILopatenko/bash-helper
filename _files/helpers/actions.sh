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
   ssh -t -o StrictHostKeyChecking=no $1@$2 $3
}

connectToProxmoxFirst(){
   command='sudo apt update && sudo apt upgrade -y && sudo apt install git && git clone https://github.com/ilopatenko/bash-helper && sudo reboot'
   connectToServer "test" "$1" "$command"
}

