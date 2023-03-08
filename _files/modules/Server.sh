#!/usr/bin/bash
#SERVER MENU MODULE

source ./_files/helpers/colors.sh
source ./_files/helpers/menu.sh
source ./_files/helpers/actions.sh
source ./_files/helpers/questions.sh


printServerMenu(){
   printDefaultMenu7Lines "$mt3" "$mi31" "$mi32" "$mi33" "$mi34" "$mi35" "$mi36" "$mi37"
   serverMenuQuestions
}

#CONNECTION MENU TITLE
mt3="SERVER MENU${resUnd}          "
#CONNECTION MENU LIST ITEMS
mi31="COMMON PACKAGES      "
ansmi31="install common packages (openssh-server git nano wget tar htop nfs-common p7zip-full gpg)"
mi32="INSTALL NETMAKER SERV"
ansmi32="install Netmaker VPN Server"
mi33="INSTALL DOCKER STACK "
ansmi33="install Docker Stack (Docker, Docker-Compose, NginX, Portainer, Navidrome)"
mi34="${faultAction}${blink}CONNECT NFS SHARE${resBlink}    "
ansmi34="connect LAN NFS Share (TrueNas)"
mi35="INSTALL NETMAKER CL. "
ansmi35="install Netmaker VPN Client"
mi36="${GrayT}       RESERVED      "
mi37="${information}       Q - EXIT      "



#QUESTIONS BLOCK
serverMenuQuestions(){
   while true
   do
   echo -e "${question}"
   read -p " CHOSE THE NEXT ACTION: " answer
   case $answer in
   1|i|I|install|INSTALL) responceToChoose "$ansmi31";sleep 1;generalTools;clear -x;printServerMenu;;
   2|ns|NS|netmakerserver|NETMAKERSERVER) responceToChoose "$ansmi32";sleep 1;netmakerServer;clear -x;printServerMenu;;
   3|ds|DS|dockers|DOCKERS) responceToChoose "$ansmi33";sleep 1;dockerStack;clear -x;printServerMenu;;
   4|nfs|NFS) responceToChoose "$ansmi33";sleep 1;dockerStack;clear -x;printServerMenu;;
   5|nc|NC) responceToChoose "$ansmi33";sleep 1;netmakerClient;clear -x;printServerMenu;;
   q|Q) printMainMenu;;
   *) echo -e "${faultAction}${blink}$answer IS A WRONG SELECTION.${resBlink} \n
   ${information}TRY TO USE:\n${successAction}   ${underlined}1 (I, INSTALL)${resUnd}${information} - IF YOU WANT TO INSTALL COMMON PACKAGES\n
${successAction}   ${underlined}2 (NS, NETMAKERSERVER)${resUnd}${information} - IF YOU WANT TO INSTALL NETMAKER VPN SERVER";sleep 3;clear -x;printConnectionMenu;;
   esac
   done

}

