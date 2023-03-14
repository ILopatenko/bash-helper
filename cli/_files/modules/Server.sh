#!/usr/bin/bash
#SERVER MENU

source ./_files/helpers/menu.sh
source ./_files/helpers/colors.sh
source ./_files/helpers/questions.sh
source ./_files/helpers/actions.sh
source ./_files/modules/Desktop.sh
source ./_files/modules/Connection.sh


menuTitle3="= SERVER MENU ="

menuItem31="1.INSTALL ESSENTIAL SOFT"
confMI31="install all the essential tools (openssh-server git nano wget tar htop nfs-common gpg)"

menuItem32="2. SETUP NETMAKER SERVER" 
confMI32="install Netmaker VPN Server"

menuItem33="3. SETUP NGINX SERVER   "
confMI33="install NginX Server and Netmaker Client"

menuItem34="4. INSTALL DOCKER STACK "
confMI34="install Docker Stack (Docker, Docker-Compose, NginX, Portainer and Navidrome)"

menuItem35="5. INSTALL NETMAKER CL. "
confMI35="install Netmaker VPN Client"


printServerMenu(){
   printMenu "${menuTitle3}" "${menuItem31}" "${menuItem32}" "${menuItem33}" "${menuItem34}" "${menuItem35}" "${RESERVED}"  "${RESERVED}"
}

serverMenuQuestions(){

   while true
   do
   echo -e "${choose}"
   read -p " I WOULD LIKE TO: " answer
   case $answer in
   
   1|ET|et) 
   confirmation "$confMI31";
   wait1; 
   essentialTools;
   clear -x; 
   serverMenu;;

   2|NM|nm)
   confirmation "$confMI32";
   wait1;
   netmakerServer;
   clear -x;
   serverMenu;;

   3|NX|nx) 
   confirmation "$confMI33";
   wait1;
   setupNginx;
   clear -x;
   serverMenu;;

   4|D|d)
   confirmation "$confMI34";
   wait1;
   dockerStack;
   clear -x;
   serverMenu;;

   5|NC|nc)
   confirmation "$confMI35";
   wait1;
   netmakerClient;
   clear -x;
   serverMenu;;

   q|Q) exit;;

   *) echo -e "
   ${error}${blink}$answer IS A WRONG SELECTION.${resBlink} \n
   ${info}TRY TO USE:\n
   ${good}   ${underlined}1 OR ET${resUnd}${info} - IF YOU WANT TO INSTAL ESSENTIAL TOOLS
   ${good}   ${underlined}2 OR NM${resUnd}${info} - IF YOU WANT TO SETUP NETMAKER SERVER
   ${good}   ${underlined}3 OR NX${resUnd}${info} - IF YOU WANT TO SETUP NGINX SERVER
   ${good}   ${underlined}4 OR D${resUnd}${info} - IF YOU WANT TO INSTALL DOCKER STACK
   ${good}   ${underlined}5 OR D${resUnd}${info} - IF YOU WANT TO INSTALL NETMAKET CLIENT";
   sleep 4;
   clear -x;
   serverMenu;;
   esac
   done
}


serverMenu(){
   printServerMenu
   serverMenuQuestions
}