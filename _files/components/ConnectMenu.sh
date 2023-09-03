#!/bin/bash
# CONNECT MENU
source ./_files/helpers/menu.sh
source ./_files/helpers/actions.sh


MT8="CONNECT MENU"
MI81="CONNECT TO ONE OF MY LAN PROXMOX SERVERS"
MI82="CONNECT TO MY ORACLE SERVER (NGINX)"
MI83="CONNECT TO MY ORACLE SERVER (NETMAKER)"


ConnectMenu(){

   MenuComponent \
   "$MI81" \
   "$MI82" \
   "$MI83" \
   false \
   false \
   false \
   false \
   false \
   false \
   "8" \
   "$MT8"

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

