#!/usr/bin/bash
#MENU HELPER

source ./_files/helpers/colors.sh


   emptyOuterLine="${mainBG}                                                "
       borderLine="   ${frame} **************************************** ${mainBG}   "
   emptyInnerLine="   ${frame} * ${innerBG}                                    ${frame} * ${mainBG}   "
         
menuTitle="TITLE 15 SYMBOL"
textContent="THIS IS AN EXAMPLE OF 25"

   printEmptyOuterLine(){
      echo -e "$emptyOuterLine"
   }
   printBorderLine(){
      echo -e "$borderLine"
   }
   printEmptyInnerLine(){
      echo -e "$emptyInnerLine"
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


printMainMenu(){
   printMenu "$1" "$2" "$3" "$4" "$5" "$6" "$7" "$8"
}