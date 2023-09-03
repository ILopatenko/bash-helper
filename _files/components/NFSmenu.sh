#!/bin/bash
# NFS MENU
source ./_files/helpers/menu.sh
source ./_files/helpers/actions.sh


MI_9_1="CONNECT ALL THE SHARES (DELL + RYZEN)"
MI_9_2="CONNECT ALL THE DELL SHARES"
MI_9_3="CONNECT ALL THE RYZEN SHARES"
MI_9_4="CONNECT SSD-IT DELL SHARE"
MI_9_5="CONNECT SSD-MEDIA DELL SHARE"
MI_9_6="CONNECT R2TER-SHARE RYZEN SHARE"
MI_9_7="CONNECT R2TER-MEDIA RYZEN SHARE"
MI_9_8="CONNECT R2TER-IT RYZEN SHARE"


NFSmenu(){

   MenuComponent \
   "$MI_9_1" \
   "$MI_9_2" \
   "$MI_9_3" \
   "$MI_9_4" \
   "$MI_9_5" \
   "$MI_9_6" \
   "$MI_9_7" \
   "$MI_9_8" \
   false \
   "9" \
   "$MT_9"

   CLIselector \
   connectAllNfsShares \
   connectAllDellShares \
   connectAllRyzenShares \
   connectSsdItDellShare \
   connectSsdMediaDellShare \
   connectR2TerShareRyzenShare \
   connectR2TerMediaRyzenShare \
   connectR4TerItRyzenShare \
   printInDevelopmentPage \
   MainMenu \
   printWrongSelectionPage \
   NFSmenu
}

