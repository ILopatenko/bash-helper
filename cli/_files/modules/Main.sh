#!/usr/bin/bash
#MAIN MENU

source ./_files/helpers/menu.sh
source ./_files/helpers/color.sh


menuTitle0=" = MAIN MENU = "
menuItem01="1. UPDATE AND UPGRADE   "
menuItem02="2. SSH TO YOUR SERVER   "
menuItem03="3. SETUP YOUR SERVER    "
menuItem04="4. SETUP UBUNTU DESKTOP "


printMainMenu(){
   printMenu "${menuTitle0}" "${menuItem01}" "${menuItem02}" "${menuItem03}" "${menuItem04}" "${RESERVED}" "${RESERVED}"  "${RESERVED}"
}