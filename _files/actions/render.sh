#!/bin/bash

source ./_files/components/MenuComponent.sh
source ./_files/components/PageComponent.sh
source ./_files/content/menuItems.sh
source ./_files/content/pageStrings.sh


##MENUS

renderMainMenu(){
   activeItem=1
   MenuUIcomponent "${mainMenuContent[@]}"
}

renderUbuntuServerMenu(){
   activeItem=1
   MenuUIcomponent "${setupNewUbuntuServerMenu[@]}"
}

renderUbuntuDesktopMenu(){
   activeItem=1
   MenuUIcomponent "${setupNewUbuntuDesktopMenu[@]}"
}






##PAGES
renderWelcomePage(){
   PageComponent "${welcomePageContent[@]}"
   sleep $delayForPages
}

renderInDevelopmentPage(){
   PageComponent "${inDevelopmentPageContent[@]}"
   sleep $delayForPages
}