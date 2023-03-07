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
   echo -e "${information}"
   case $answer in
   1|U|u|update|UPDATE) responceToChoose "$ansmi01";sleep 1;updateUpgrade;clear -x;printMainMenu;;
   2|C|c|connect|CONNECT) responceToChoose "$ansmi02";sleep 1;printConnectionMenu;clear -x;printMainMenu;;
   q|Q|quit|exit) exit;;
   *) echo -e "${faultAction}${blink}$answer IS A WRONG SELECTION.${resBlink} \n
   ${information}TRY TO USE:\n${successAction}   ${underlined}1 (U, UPDATE)${resUnd}${information} - IF YOU WANT TO UPDATE AND UPGRADE THIS MACHINE\n
${successAction}   ${underlined}2 (C, CONNECT)${resUnd}${information} - IF YOU WANT TO CONNECT TO THE ONE OF YOUR SERVERS";sleep 3;clear -x;    printMainMenu;;
esac
done

}
