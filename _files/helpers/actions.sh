#!/usr/bin/bash
#ACTIONS

source ./_files/helpers/colors.sh



updateUpgrade(){
   sudo apt update && sudo apt upgrade -y
   sleep 0.5
   echo -e "${successAction}OK. The task to update and upgrade your system was done!"
   sleep 1.5
}

