#!/bin/bash



mainMenuContent=(
   "BASH HELPER MAIN MENU" 

   "SETUP A NEW UBUNTU SERVER" 
   "SETUP A NEW UBUNTU DESKTOP/LAPTOP"
   "SETUP A NEW ORACLE SERVER"
   "INSTALL DOCKER AND DOCKER STACK"
   "MY LAN SETTINGS"
   "IN DEVELOPNET"
   "IN DEVELOPNET"
   
   
   renderUbuntuServerMenu
   sayHi
   sayHello
   sayHi
   sayHello
   sayHi
   sayHello

   exitPage
)


setupNewUbuntuServerMenu=(
   "SETUP A NEW UBUNTU SERVER"

   "UPDATE AND UPGRADE YOUR SYSTEM"
   "INSTALL INITIAL SOFT"
   "INSTALL ADDITIONAL SOFT"
   "INSTALL DOCKER AND DOCKER STACK"
   "IN DEVELOPNET"
   "IN DEVELOPNET"
   "IN DEVELOPNET"

   updateUpgradeSystemHandler
   sayHi
   sayHello
   sayHi
   sayHello
   sayHi
   sayHello

   renderMainMenu

)