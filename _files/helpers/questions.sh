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
   sleep 0.2
}

rejectedChoose(){
   echo -e "${faultAction}NO. Let's just skip this step"
   sleep 0.2
}


askYesNoQuestion(){
   echo -e "${question}"
   while true; do
      read -p "$1" yn
      case $yn in
         [Yy]* ) return 0;;
         [Nn]* ) return 1;;
         * ) echo "Please answer Y or N.";;
      esac
   done
   echo -e "${reset}"
}

askYesNoQuestionWithActions(){
   if askYesNoQuestion "Would you like to $1? [y/n] "; then
      responceToChoose "$1"
      sleep 1
      $2
   else
      rejectedChoose
      sleep 1
      $3
   fi
}