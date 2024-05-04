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
   renderUbuntuDesktopMenu
   renderInDevelopmentPage
   renderInDevelopmentPage
   renderInDevelopmentPage
   renderInDevelopmentPage
   renderInDevelopmentPage

   exitPage
)


setupNewUbuntuServerMenu=(
   "SETUP A NEW UBUNTU SERVER"

   "UPDATE AND UPGRADE YOUR SYSTEM"
   "INSTALL INITIAL SERVER SOFT"
   "INSTALL NODEJS"
   "INSTALL DOCKER AND DOCKER STACK"
   "INSTALL DOCKER"
   "IN DEVELOPNET"
   "IN DEVELOPNET"

   updateUpgradeSystemCommand
   installInitialServerSoftCommand
   installNodejsCommand
   installDockerStackCommand
   installDockerCommand
   renderInDevelopmentPage
   renderInDevelopmentPage

   renderMainMenu

)

setupNewUbuntuDesktopMenu=(
   "SETUP A NEW UBUNTU DESKTOP/LAPTOP"

   "UPDATE AND UPGRADE YOUR SYSTEM"
   "INSTALL INITIAL DESCKTOP SOFT"
   "INSTALL VSC, ZOOM, SLACK, NODEJS, CHROME"
   "INSTALL DOCKER AND DOCKER STACK"
   "INSTALL DOCKER"
   "IN DEVELOPNET"
   "IN DEVELOPNET"

   updateUpgradeSystemCommand
   installInitialDesktopSoftCommand
   installBigSoft
   installDockerStackCommand
   installDockerCommand
   renderInDevelopmentPage
   renderInDevelopmentPage

   renderMainMenu

)