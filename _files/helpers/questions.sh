#!/usr/bin/bash
#QUESTIONS


source ./_files/helpers/colors.sh
source ./_files/helpers/actions.sh

askUserInput(){
   read -p "$1" userInput
   echo $userInput
}



responceToChoose(){
   echo -e "${successAction}YES. Let's $1${information}"
   sleep 1
}

rejectedChoose(){
   echo -e "${faultAction}NO. Let's just skip this step"
   sleep 1
}


