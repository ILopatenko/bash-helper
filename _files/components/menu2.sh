#!/bin/bash
# UI MENU HELPER
source ../helpers/colors.sh


backgroundWidth=85
backgroundTopBottomGap=2
backgroundLeftGap=4
menuOuterGap=5
menuInnerGap=3

backgroundColor=$blueBGD
borderSymbol="H"
borderBackground=$magentaBGD
borderSymbolColor=$yellowTCD
borderStyle="$borderBackground$borderSymbolColor$boldTE"
menuBackground=$cyanBGD
innerEmptyMenuStringLength=$(($backgroundWidth - $menuOuterGap - $menuOuterGap - 6))
menuMaxTextLength=$(($innerEmptyMenuStringLength - $menuInnerGap - $menuInnerGap - 3))







printBackgroundTopBottomGap(){
   for ((i = 0 ; i < $backgroundTopBottomGap ; i++)); do
      echo
   done
}

getString(){
   string=''
   for ((i = 0 ; i < $1 ; i++)); do
   if [[ $((i%2)) -eq 0 ]]; then
      string+="$2"
   else
      string+="$4"
   fi
   done
   echo "$3$string$dropAllEffects"
}

emptyGapString="$(getString $backgroundLeftGap " " $dropAllEffects " ")"
backgroundEmptyString="$(getString $backgroundWidth " " $backgroundColor " ")"

printEmptyBackgroundLine(){
   echo -e "$emptyGapString$backgroundEmptyString"
}

backgroundGapString="$(getString $menuOuterGap " " $backgroundColor " ")"
singleBorderSymbol3="$borderStyle $borderSymbol "
innerEmptyMenuString="$(getString $innerEmptyMenuStringLength " " $menuBackground " ")"
innerBorderMenuString="$(getString $innerEmptyMenuStringLength $borderSymbol $borderStyle " ")"

printEmptyMenuLine(){
   echo -e "$emptyGapString$backgroundGapString$singleBorderSymbol3$innerEmptyMenuString$singleBorderSymbol3$backgroundGapString"
}

printBorderMenuLine(){
   echo -e "$emptyGapString$backgroundGapString$singleBorderSymbol3$innerBorderMenuString$singleBorderSymbol3$backgroundGapString"
}

innerMenuGap=$(getString $menuInnerGap " " $menuBackground " ")
leftPartForMenuLine="$emptyGapString$backgroundGapString$singleBorderSymbol3$innerMenuGap"
rightPartForMenuLine="$innerMenuGap$singleBorderSymbol3$backgroundGapString"

printMenuLineWithContent(){
   if [[ $(($1)) ]]
   
}


MenuComponent(){
   clear -x
   printBackgroundTopBottomGap
   printEmptyBackgroundLine
   printEmptyBackgroundLine
   printBorderMenuLine
   printEmptyMenuLine
   printEmptyMenuLine
   printBorderMenuLine
   printEmptyBackgroundLine
   printEmptyBackgroundLine
   printBackgroundTopBottomGap

}

MenuComponent