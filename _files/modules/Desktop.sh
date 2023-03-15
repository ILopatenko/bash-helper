#!/usr/bin/bash
#DESKTOP MENU

source ./_files/helpers/menu.sh
source ./_files/helpers/colors.sh
source ./_files/helpers/questions.sh
source ./_files/helpers/actions.sh
source ./_files/helpers/disks.sh


menuTitle4=" =  DESKTOP  = "

menuItem41="1.INSTALL ESSENTIAL SOFT"
confMI41="install all the essential tools for Ubuntu/Linux Mint Desktop/Laptop"

menuItem42="2. INSTALL BIG SOFT     "
confMI42="install all the big tools (Zoom, Slack, Chrome, VSCode and NodeJS)"

menuItem43="3. CONNECT NFS SHARES   "
confMI43="connect local Disks and LAN NFSs"

menuItem44="4. INSTALL NM VPN CLIENT"
confMI44="install Netmaker VPN (WireGuard) CLI client"


printDesktopMenu(){
   printMenu "${menuTitle4}" "${menuItem41}" "${menuItem42}" "${menuItem43}" "${menuItem44}" "${RESERVED}" "${RESERVED}"  "${RESERVED}"
}

desktopMenuQuestions(){
  
   while true
   do
   echo -e "${choose}"
   read -p " I WOULD LIKE TO: " answer
   case $answer in
   
   1|DT|dt) 
   confirmation "$confMI41";
   wait1; 
   desktopTools;
   clear -x; 
   desktopMenu;;

   2|BS|bs) 
   confirmation "$confMI42";
   wait1;
   bigSoft;
   clear -x;
   desktopMenu;;

   3|S|s) 
   confirmation "$confMI43";
   wait1;
   connectDisks;
   clear -x;
   desktopMenu;;

   4|D|d)
   confirmation "$confMI44";
   wait1;
   netmakerClient;
   clear -x;
   desktopMenu;;

   q|Q) exit;;

   *) echo -e "
   ${error}${blink}$answer IS A WRONG SELECTION.${resBlink} \n
   ${info}TRY TO USE:\n
   ${good}   ${underlined}1 OR U${resUnd}${info} - IF YOU WANT TO INSTALL ESSENTIAL TOOLS
   ${good}   ${underlined}2 OR C${resUnd}${info} - IF YOU WANT TO INSTALL BIG SOFT
   ${good}   ${underlined}3 OR S${resUnd}${info} - IF YOU WANT TO CONNECCT DISKS
   ${good}   ${underlined}4 OR D${resUnd}${info} - IF YOU WANT TO INSTALL NETMAKER VPN CLIENT";
   sleep 4;
   clear -x;
   desktopMenu;;
   esac
   done
}


desktopMenu(){
   printDesktopMenu
   desktopMenuQuestions
}