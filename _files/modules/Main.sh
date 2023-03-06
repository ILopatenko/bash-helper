#!/usr/bin/bash
#MAIN MENU MODULE

source ./_files/helpers/colors.sh
source ./_files/helpers/menu.sh
source ./_files/helpers/actions.sh
source ./_files/helpers/questions.sh
source ./_files/modules/Connection.sh


printMainMenu(){
   printDefaultMenu7Lines "$mt0" "$mi01" "$mi02" "$mi03" "$mi04" "$mi05" "$mi06" "$mi07"
   mainMenuQuestions
}

#MAIN MENU TITLE
mt0="MAIN MENU${resUnd}            "
#MAIN MENU LIST ITEMS
mi01="UPDATE AND UPGRADE   "
ansmi01="update and upgrade your system"
mi02="CONNECT TO THE SERVER"
ansmi02="connect to one of your servers"
mi03="${GrayT}       RESERVED      "
mi04="${GrayT}       RESERVED      "
mi05="${GrayT}       RESERVED      "
mi06="${GrayT}       RESERVED      "
mi07="${information}       Q - EXIT      "


#QUESTIONS BLOCK
mainMenuQuestions(){
   while true
   do
   echo -e "${question}"
   read -p " THE NEXT ACTION IS: " answer
   case $answer in
   1) responceToChoose "$ansmi01";sleep 1;updateUpgrade;clear -x;printMainMenu;;
   2) responceToChoose "$ansmi02";sleep 1;printConnectionMenu;clear -x;printMainMenu;;
   q|Q) exit;;
   *) echo -e "${error}$answer is a wrong selection";sleep 1;clear -x;printMainMenu;;
esac
done

}
