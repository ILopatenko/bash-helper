#!/bin/bash
# SERVER MENU
source ./_files/helpers/menu.sh
source ./_files/helpers/actions.sh


MT1="SERVER MENU"
MI11="UPDATE AND UPGRADE THIS NEW UBUNTU SERVER"
MI12="INSTALL INITIAL SERVER SOFT"
MI13="INSTALL DOCKER STACK"


ServerMenu(){

   MenuComponent \
   "$MI11" \
   "$MI12" \
   "$MI13" \
   false \
   false \
   false \
   false \
   false \
   false \
   "1" \
   "$MT1"

   CLIselector \
   updateUpgradeUbuntu \
   installInitialServerSoft \
   installDockerStack \
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

