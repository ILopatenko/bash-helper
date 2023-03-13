#!/usr/bin/bash
#QUESTIONS AND ASWERS

source ./_files/helpers/colors.sh


confirmation(){
   echo -e "${good} OK GOT IT! Let's $1!${menuItem}"
}

rejection(){
    echo -e "${error} OK! Let's just skip this step!${menuItem}"
}

reportOK(){
   echo -e "${good} GREAT! $1!"
   sleep 1
}

provideInfo(){
   echo -e "${info}$1!"
   sleep 1
}

askYesNoQuestion(){
   echo -e "${choose}"
   while true; do
      read -p "$1" yn
      case $yn in
         [Yy]* ) return 0;;
         [Nn]* ) return 1;;
         * ) echo "Please answer Y or N.";;
      esac
   done
}

askYesNoQuestionWithActions(){
   if askYesNoQuestion "Would you like to $1? [y/n] "; then
      confirmation "$1"
      sleep 0.5
      $2
   else
      rejection
      sleep 0.5
      $3
   fi
}