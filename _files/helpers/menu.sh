#!/usr/bin/bash
#MENU HELPER

source ./_files/helpers/colors.sh


printEmptyOuterLine(){
   echo -e "${mainBG}                                                "
}
printBorderLine(){
   echo -e "   ${frame} **************************************** ${mainBG}   "
}
printEmptyInnerLine(){
   echo -e "   ${frame} * ${innerBG}                                    ${frame} * ${mainBG}   "
}
printTextLine(){
   echo -e "   ${frame} * ${innerBG}      ${menuItem}$1      ${frame} * ${mainBG}   "
}

printMenuTitle(){
   echo -e "   ${frame} * ${innerBG}           ${menuT}$1${resUnd}${innerBG}          ${frame} * ${mainBG}   "
}



printMenu(){
   clear -x
   echo
   printEmptyOuterLine
   printBorderLine
   printEmptyInnerLine
   printMenuTitle "$1"
   printEmptyInnerLine
   printTextLine "$2"
   printTextLine "$3"
   printTextLine "$4"
   printTextLine "$5"
   printTextLine "$6"
   printTextLine "$7"
   printTextLine "$8"
   printEmptyInnerLine
   printBorderLine
   printEmptyOuterLine
   echo -e "${reset}"
}
