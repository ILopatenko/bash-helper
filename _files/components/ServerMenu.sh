#!/bin/bash
# SERVER MENU
source ./_files/helpers/menu.sh
source ./_files/helpers/actions.sh
source ./_files/components/NFSmenu.sh


MI_1_1="UPDATE AND UPGRADE THIS NEW UBUNTU SERVER"
MI_1_2="INSTALL INITIAL SERVER SOFT"
MI_1_3="CONNECT LAN NFS SHARES"
MI_1_4="INSTALL DOCKER STACK"


ServerMenu(){

   MenuComponent \
   "$MI_1_1" \
   "$MI_1_2" \
   "$MI_1_3" \
   false \
   false \
   false \
   false \
   false \
   false \
   "1" \
   "$MT_1"

   CLIselector \
   updateUpgradeUbuntu \
   installInitialServerSoft \
   NFSmenu \
   printInDevelopmentPage \
   printInDevelopmentPage \
   printInDevelopmentPage \
   printInDevelopmentPage \
   printInDevelopmentPage \
   printInDevelopmentPage \
   MainMenu \
   printWrongSelectionPage \
   ServerMenu
}

