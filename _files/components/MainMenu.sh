#!/bin/bash
# MAIN MENU
source ./_files/helpers/menu.sh
source ./_files/components/ServerMenu.sh
source ./_files/components/ConnectMenu.sh





MT0="MAIN MENU"
MI01="SETUP A NEW UBUNTU SERVER"
MI02="SETUP A NEW UBUNTU DESKTOP/LAPTOP"
MI03="SETUP A NEW ORACLE SERVER"

MI08="CONNECT (SSH) TO A SERVER"


MainMenu(){

   MenuComponent \
   "$MI01" \
   "$MI02" \
   "$MI03" \
   false \
   false \
   false \
   false \
   "$MI08" \
   false \
   "0" \
   "$MT0"

   CLIselector \
   ServerMenu \
   printHello \
   printHello \
   printInDevelopmentPage \
   printInDevelopmentPage \
   printInDevelopmentPage \
   printInDevelopmentPage \
   ConnectMenu \
   printInDevelopmentPage \
   printPreExitPage \
   printWrongSelectionPage \
   MainMenu
}

