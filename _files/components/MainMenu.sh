#!/bin/bash
# MAIN MENU
source ./_files/helpers/menu.sh
source ./_files/components/ServerMenu.sh
source ./_files/components/ConnectMenu.sh
source ./_files/components/NFSmenu.sh





MT_0="MAIN MENU"
MT_1="SETUP A NEW UBUNTU SERVER"
MT_2="SETUP A NEW UBUNTU DESKTOP/LAPTOP"
MT_3="SETUP A NEW ORACLE SERVER"

MT_8="CONNECT (SSH) TO A SERVER"
MT_9="CONNECT LAN NFS SHARES"


MainMenu(){

   MenuComponent \
   "$MT_1" \
   "$MT_2" \
   "$MT_3" \
   false \
   false \
   false \
   false \
   "$MT_8" \
   "$MT_9" \
   "0" \
   "$MT_0"

   CLIselector \
   ServerMenu \
   printHello \
   printHello \
   printInDevelopmentPage \
   printInDevelopmentPage \
   printInDevelopmentPage \
   printInDevelopmentPage \
   ConnectMenu \
   NFSmenu \
   printPreExitPage \
   printWrongSelectionPage \
   MainMenu
}

