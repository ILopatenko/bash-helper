#!/usr/bin/bash
#SERVER MENU MODULE

source ./_files/helpers/colors.sh
source ./_files/helpers/menu.sh
source ./_files/helpers/actions.sh
source ./_files/helpers/questions.sh


printServerMenu(){
   printDefaultMenu7Lines "$mt3" "$mi31" "$mi32" "$mi33" "$mi34" "$mi35" "$mi36" "$mi37"
   connectionMenuQuestions
}

#CONNECTION MENU TITLE
mt3="SERVER MENU${resUnd}          "
#CONNECTION MENU LIST ITEMS
mi31="COMMON PACKAGES      "
ansmi31="connect to your LAN ProxMox server"
mi32="INSTALL NETMAKER SERV"
ansmi32="install Netmaker VPN Server"
mi33="INSTALL DOCKER STACK "
ansmi33="install Docker Stack (Docker, Docker-Compose, NginX, Portainer, Navidrome)"
mi34="${faultAction}${blink}CONNECT NFS SHARE${resBlink}    "
ansmi33="connect LAN NFS Share (TrueNas)"
mi35="${GrayT}       RESERVED      "
mi36="${GrayT}       RESERVED      "
mi37="${information}       Q - EXIT      "

ansmi331="connect to your NETMAKER Oracle Cloud Server"
ansmi333="connect to your NGINX Oracle Cloud Server"



#QUESTIONS BLOCK
connectionMenuQuestions(){
   while true
   do
   echo -e "${question}"
   read -p " CHOSE THE CONNECTION TYPE: " answer
   case $answer in
   1|cp|CP|proxmox|PROXMOX) responceToChoose "$ansmi01";sleep 1;connectProxMoxServer;clear -x;printMainMenu;;
   2|co|CO|oracle|ORACLE) responceToChoose "$ansmi02";sleep 1;connectOracleServer;clear -x;printMainMenu;;
   q|Q) printMainMenu;;
   *) echo -e "${faultAction}${blink}$answer IS A WRONG SELECTION.${resBlink} \n
   ${information}TRY TO USE:\n${successAction}   ${underlined}1 (CP, PROXMOX)${resUnd}${information} - IF YOU WANT TO CONNECT TO YOUR LAN PROXMOX SERVER\n
${successAction}   ${underlined}2 (CO, ORACLE)${resUnd}${information} - IF YOU WANT TO CONNECT TO YOUR ORACLE SERVER";sleep 3;clear -x;printConnectionMenu;;
   esac
   done

}

connectProxMoxServer(){
   echo -e "${userInput}"
   host="192.168.0.$(askUserInput "Please enter the last part of your server's IP: 192.168.0.")"
   askYesNoQuestionWithActions "to prepare and perform your first connection to your LAN ProxMox server" "connectToProxmoxFirst $host" "connectToServer "test" $host"
}

connectOracleServer(){
   while true
   do
   echo -e "${question}"
   read -p " CHOSE THE SERVER (1 - NETMAKER, 2 - NGINX, Q - EXIT TO CONNECTION MENU): " answer
   case $answer in
   1|netmaker|NETMAKER) responceToChoose "$ansmi221";sleep 1;connectOracle "netmaker";clear -x;printMainMenu;;
   2|nginx|NGINX) responceToChoose "$ansmi222";sleep 1;connectOracle "nginx";clear -x;printMainMenu;;
   q|Q) printConnectionMenu;;
   *) echo -e "${faultAction}${blink}$answer IS A WRONG SELECTION.${resBlink} \n
   ${information}TRY TO USE:\n${successAction}   ${underlined}1 (NETMAKER)${resUnd}${information} - IF YOU WANT TO CONNECT TO YOUR NETMAKER ORACLE CLOUD SERVER\n
${successAction}   ${underlined}2 (ORACLE)${resUnd}${information} - IF YOU WANT TO CONNECT TO YOUR NGINX ORACLE CLOUD SERVER";sleep 3;clear -x;connectOracleServer;;
   esac
   done

}

