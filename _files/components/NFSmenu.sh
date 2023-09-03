#!/bin/bash
# NFS MENU
source ./_files/helpers/menu.sh
source ./_files/helpers/actions.sh


MT10="NFS MENU"
MI101="CONNECT ALL THE SHARES (DELL + RYZEN)"
MI102="CONNECT ALL THE DELL SHARES"
MI103="CONNECT ALL THE RYZEN SHARES"


NFSmenu(){

   MenuComponent \
   "$MI101" \
   "$MI102" \
   "$MI103" \
   false \
   false \
   false \
   false \
   false \
   false \
   "10" \
   "$MT10"

   CLIselector \
   connectAllNfsShares \
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
   NFSmenu
}

