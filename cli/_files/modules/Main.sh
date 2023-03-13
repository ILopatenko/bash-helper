#!/usr/bin/bash
#MAIN MENU

source ./_files/helpers/menu.sh
source ./_files/helpers/colors.sh
source ./_files/helpers/questions.sh
source ./_files/helpers/actions.sh
source ./_files/modules/Desktop.sh
source ./_files/modules/Connection.sh


menuTitle0=" = MAIN MENU = "

menuItem01="1. UPDATE AND UPGRADE OS"
confMI01="update and upgrade your system"

menuItem02="2. SSH TO REMOTE SERVER "
confMI02="connect to your server via SSH"

menuItem03="3. SETUP UBUNTU SERVER  "
confMI03="setup your Ubuntu server"

menuItem04="4. SETUP UBUNTU DESKTOP "
confMI04="setup your Ununtu/Linux Mint Desktop/Laptop"


printMainMenu(){
   printMenu "${menuTitle0}" "${menuItem01}" "${menuItem02}" "${menuItem03}" "${menuItem04}" "${RESERVED}" "${RESERVED}"  "${RESERVED}"
}

mainMenuQuestions(){

   while true
   do
   echo -e "${choose}"
   read -p " I WOULD LIKE TO: " answer
   case $answer in
   
   1|U|u) 
   confirmation "$confMI01";
   wait1; 
   updateUpgrade;
   clear -x; 
   mainMenu;;

   2|C|c) 
   confirmation "$confMI02";
   wait1;
   connectionMenu;
   clear -x;
   mainMenu;;

   3|S|s) 
   confirmation "$confMI03";
   wait1;
   serverMenu;
   clear -x;
   mainMenu;;

   4|D|d)
   confirmation "$confMI04";
   wait1;
   desktopMenu;
   clear -x;
   mainMenu;;

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
   mainMenu;;
   esac
   done
}


mainMenu(){
   printMainMenu
   mainMenuQuestions
}