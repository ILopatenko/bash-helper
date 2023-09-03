#!/bin/bash
# CONNECT MENU
source ./_files/helpers/menu.sh
source ./_files/helpers/actions.sh


MI_8_1="CONNECT TO ONE OF MY LAN PROXMOX SERVERS"
MI_8_2="CONNECT TO MY ORACLE SERVER (NGINX)"
MI_8_3="CONNECT TO MY ORACLE SERVER (NETMAKER)"


ConnectMenu(){

   MenuComponent \
   "$MI_8_1" \
   "$MI_8_2" \
   "$MI_8_3" \
   false \
   false \
   false \
   false \
   false \
   false \
   "8" \
   "$MT_8"

   CLIselector \
   connectToLanProxmoxServer \
   printInDevelopmentPage \
   printInDevelopmentPage \
   printInDevelopmentPage \
   printInDevelopmentPage \
   printInDevelopmentPage \
   printInDevelopmentPage \
   printInDevelopmentPage \
   printInDevelopmentPage \
   MainMenu \
   printWrongSelectionPage \
   ConnectMenu
}

