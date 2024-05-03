#!/bin/bash

source ./_files/components/MenuComponent.sh
source ./_files/components/PageComponent.sh
source ./_files/content/menuItems.sh
source ./_files/content/pageStrings.sh


##MENUS

renderMainMenu(){
   MenuUIcomponent "${mainMenuContent[@]}"
}

renderUbuntuServerMenu(){
   MenuUIcomponent "${setupNewUbuntuServerMenu[@]}"
}






##PAGES
renderWelcomePage(){
   PageComponent "${welcomePageContent[@]}"
   sleep $delayForPages
}