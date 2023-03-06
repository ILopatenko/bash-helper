#!/usr/bin/bash
#CONNECTION MENU MODULE

source ./_files/helpers/colors.sh
source ./_files/helpers/menu.sh
source ./_files/helpers/actions.sh
source ./_files/helpers/questions.sh


printConnectionMenu(){
   printDefaultMenu7Lines "$mt2" "$mi21" "$mi22" "$mi23" "$mi24" "$mi25" "$mi26" "$mi27"
   connectionMenuQuestions
}

#CONNECTION MENU TITLE
mt2="CONNECTION MENU${resUnd}      "
#CONNECTION MENU LIST ITEMS
mi21="PROXMOX LAN SERVER   "
ansmi21="connect to your LAN ProxMox server"
mi22="ORACLE CLOUD SERVER  "
ansmi22="connect to your Cloud Oracle server"
mi23="${GrayT}       RESERVED      "
mi24="${GrayT}       RESERVED      "
mi25="${GrayT}       RESERVED      "
mi26="${GrayT}       RESERVED      "
mi27="${information}       Q - EXIT      "


#QUESTIONS BLOCK
connectionMenuQuestions(){
   while true
   do
   echo -e "${question}"
   read -p " THE NEXT ACTION IS: " answer
   case $answer in
   1) responceToChoose "$ansmi01";sleep 1;connectProxMoxServer;clear -x;printMainMenu;;
   2) responceToChoose "$ansmi02";sleep 1;printConnectionMenu;clear -x;printMainMenu;;
   q|Q) exit;;
   *) echo -e "${error}$answer is a wrong selection";sleep 1;clear -x;printMainMenu;;
esac
done

}

connectProxMoxServer(){
   host="192.168.0.$(askUserInput "Please entter the lastt part of your server's IP: 192.168.0.")"
   askYesNoQuestionWithActions "to prepare and perform your first connection to your LAN ProxMox server" "connectToProxmoxFirst $host" "connectToServer "test" $host"

}