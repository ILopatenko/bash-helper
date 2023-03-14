#!/usr/bin/bash
#CONNECTION MENU

source ./_files/helpers/menu.sh
source ./_files/helpers/colors.sh
source ./_files/helpers/questions.sh
source ./_files/helpers/actions.sh
source ./_files/helpers/disks.sh
source ./_files/helpers/connect.sh


menuTitle2=" = CONNECTION ="

menuItem21="1. SSH TO LAN PM SERVER "
confMI21="connect to the LAN ProxMox Server"

menuItem22="2. SSH TO NETMAKER SERV."
confMI22="connect to the Netmaker VPN Oracle Cloud Server"

menuItem23="3. SSH TO NGINX SERVER  "
confMI23="connect to the Netmaker VPN Oracle Cloud Server"

menuItem24="4. SSH TO ANY SERVER    "
confMI24="connect to any Server"


printConnectionMenu(){
   printMenu "${menuTitle2}" "${menuItem21}" "${menuItem22}" "${menuItem23}" "${menuItem24}" "${RESERVED}" "${RESERVED}"  "${RESERVED}"
}

connectionMenuQuestions(){
  
   while true
   do
   echo -e "${choose}"
   read -p " I WOULD LIKE TO: " answer
   case $answer in
   
   1|PS|ps) 
   confirmation "$confMI21";
   wait1; 
   desktopTools;
   clear -x; 
   connectionMenu;;

   2|nm|NM) 
   confirmation "$confMI22";
   wait1;
   connectToOracle "netmaker";
   clear -x;
   connectionMenu;;

   3|nx|NX) 
   confirmation "$confMI23";
   wait1;
   connectToOracle "nginx";
   clear -x;
   connectionMenu;;

   4|C|c)
   confirmation "$confMI24";
   wait1;
   echo "This feature is in development ...";
   sleep 2;
   clear -x;
   connectionMenu;;

   q|Q) exit;;

   *) echo -e "
   ${error}${blink}$answer IS A WRONG SELECTION.${resBlink} \n
   ${info}TRY TO USE:\n
   ${good}   ${underlined}1 OR U${resUnd}${info} - IF YOU WANT TO UPDATE AND UPGRADE THIS MACHINE
   ${good}   ${underlined}2 OR C${resUnd}${info} - IF YOU WANT TO CONNECT TO THE ONE OF YOUR SERVERS
   ${good}   ${underlined}3 OR S${resUnd}${info} - IF YOU WANT TO SETUP YOUR UBUNTU SERVER
   ${good}   ${underlined}4 OR D${resUnd}${info} - IF YOU WANT TO SETUP YOUR UBUNTU/LINUX MINT DESKTOP/LAPTOP";
   sleep 4;
   clear -x;
   connectionMenu;;
   esac
   done
}


connectionMenu(){
   printConnectionMenu
   connectionMenuQuestions
}