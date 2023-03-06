#!/bin/bash
#MENU SCRIPT

source ./_files/helpers/colors.sh

printDefaultMenu7Lines(){
  clear -x
   echo -e "${GrayDB}"
   echo -e "                                                   "
   echo -e "     ${BlackB}${frame}*****************************************${GrayDB}     "
   echo -e "     ${BlackB}${frame}**${CyanB}                                     ${frame}**${GrayDB}     "
   echo -e "     ${BlackB}${frame}**${CyanB}             ${olTitle}$1   ${frame}**${GrayDB}     "
   echo -e "     ${BlackB}${frame}**${CyanB}                                     ${frame}**${GrayDB}     "
   echo -e "     ${BlackB}${frame}**${CyanB}    ${li} 1. $2 ${CyanB}       ${frame}**${GrayDB}     "
   echo -e "     ${BlackB}${frame}**${CyanB}    ${li} 2. $3 ${CyanB}       ${frame}**${GrayDB}     "
   echo -e "     ${BlackB}${frame}**${CyanB}    ${li} 3. $4 ${CyanB}       ${frame}**${GrayDB}     "
   echo -e "     ${BlackB}${frame}**${CyanB}    ${li} 4. $5 ${CyanB}       ${frame}**${GrayDB}     "
   echo -e "     ${BlackB}${frame}**${CyanB}    ${li} 5. $6 ${CyanB}       ${frame}**${GrayDB}     "
   echo -e "     ${BlackB}${frame}**${CyanB}    ${li} 6. $7 ${CyanB}       ${frame}**${GrayDB}     "
   echo -e "     ${BlackB}${frame}**${CyanB}    ${li} 7. $8 ${CyanB}       ${frame}**${GrayDB}     "
   echo -e "     ${BlackB}${frame}**${CyanB}                                     ${frame}**${GrayDB}     "
   echo -e "     ${BlackB}${frame}*****************************************${GrayDB}     "
   echo -e "                                                   ${reset}"
   echo -e "${quest}"
   sleep 0.1
}
