#!/bin/bash
# UI MENU HELPER
source ../helpers/colors.sh


backgroundWidth=71
backgroundTopBottomGap=1
backgroundLeftGap=2
menuOuterGap=5
menuInnerGap=3
backgroundColor=$blueBGD
borderSymbol="X"
borderBackground=$magentaBGD
borderSymbolColor=$yellowTCD
borderStyle="$borderBackground$borderSymbolColor$boldTE"
menuBackground=$cyanBGD
innerEmptyMenuStringLength=$(($backgroundWidth - $menuOuterGap - $menuOuterGap - 6))
menuMaxTextLength=$(($innerEmptyMenuStringLength - $menuInnerGap - $menuInnerGap))
titleStyle=$yellowTCD$boldTE$menuBackground
itemStyle=$grayTCDalmostWhite$boldTE$menuBackground
reservedStyle=$blackTCD$boldTE$menuBackground
thisFeatureIsInDevelopment="THIS FEATURE IS IN DEVELOPMENT"


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

printEmptyBackgroundLine(){
   echo -e "$emptyGapString$backgroundEmptyString"
}

printMenuLine(){
   echo -e "$emptyGapString$backgroundGapString$singleBorderSymbol3$dropAllEffects$1$dropAllEffects$singleBorderSymbol3$dropAllEffects$backgroundGapString"
}

printEmptyMenuLine(){
   printMenuLine "$innerEmptyMenuString"
}

printBorderMenuLine(){
   printMenuLine "$innerBorderMenuString"
}

emptyGapString="$(getString $backgroundLeftGap " " $dropAllEffects " ")"
backgroundEmptyString="$(getString $backgroundWidth " " $backgroundColor " ")"
backgroundGapString="$(getString $menuOuterGap " " $backgroundColor " ")"
singleBorderSymbol3="$borderStyle $borderSymbol "
innerEmptyMenuString="$(getString $innerEmptyMenuStringLength " " $menuBackground " ")"
innerBorderMenuString="$(getString $innerEmptyMenuStringLength $borderSymbol $borderStyle " ")"
innerMenuGap=$(getString $menuInnerGap " " $menuBackground " ")
leftPartForMenuLine="$emptyGapString$backgroundGapString$singleBorderSymbol3$dropAllEffects$innerMenuGap"
rightPartForMenuLine="$innerMenuGap$singleBorderSymbol3$dropAllEffects$backgroundGapString"

printMenuLineWithContent(){
   textContent="$1 $2"
   textLength=${#textContent}
   if [[ $textLength -gt $menuMaxTextLength ]]; then
      textContent=${textContent:0:$menuMaxTextLength}
   fi
   leftMenuContentGap=$((($menuMaxTextLength - $textLength)/2))
   rightMenuContentGap=$(($menuMaxTextLength - $textLength - $leftMenuContentGap))
   leftMenuContentGapString="$(getString $leftMenuContentGap " " $menuBackground " ")"
   rightMenuContentGapString="$(getString $rightMenuContentGap " " $menuBackground " ")"
   printLineTemplate(){
      echo -e "$leftPartForMenuLine$leftMenuContentGapString$1$textContent$dropAllEffects$rightMenuContentGapString$rightPartForMenuLine"
   }
      if [[ $3 == "title" ]]; then
         printLineTemplate "$titleStyle"
      elif [[ $3 == "item" ]]; then
         printLineTemplate "$itemStyle"
      elif [[ $3 == "reserved" ]]; then
         printLineTemplate "$reservedStyle"
      fi
}

printMenuLineTitle(){
   printMenuLineWithContent "$1" "$2" "title"
}

printMenuLineItem(){
   printMenuLineWithContent "$1" "$2" "item"
}

printMenuLineReserved(){
   printMenuLineWithContent "$1" "$thisFeatureIsInDevelopment" "reserved"
}



MenuComponent(){
   params=("$@")
   clear -x
   printBackgroundTopBottomGap
   printEmptyBackgroundLine
   printEmptyBackgroundLine
   printBorderMenuLine
   printEmptyMenuLine
   
   printMenuLineTitle "${params[-2]}" "${params[-1]}"
   for ((i = 1 ; i < ${#params[@]}-1 ; i++)); do
      if [[ ${params[$i-1]} == "false" ]]; then
         printMenuLineReserved "${params[-2]}.$i"
      else
         printMenuLineItem "${params[-2]}.$i" "${params[$i-1]}"
      fi
   done
   printEmptyMenuLine
   printBorderMenuLine
   printEmptyBackgroundLine
   printEmptyBackgroundLine
   printBackgroundTopBottomGap
}




PageComponent(){
   clear -x
   printBackgroundTopBottomGap
   printEmptyBackgroundLine
   printEmptyBackgroundLine
   printBorderMenuLine
   printEmptyMenuLine
   printMenuLineItem "" "$1" 
   printMenuLineItem "" "$2" 
   printMenuLineItem "" "$3" 
   printMenuLineItem "" "$4" 
   printMenuLineItem "" "$5" 
   printMenuLineItem "" "$6" 
   printMenuLineItem "" "$7" 
   printMenuLineItem "" "$8" 
   printMenuLineItem "" "$9" 
   printMenuLineItem "" "${10}" 
   printMenuLineItem "" "${11}" 
   printMenuLineItem "" "${12}" 
   printEmptyMenuLine
   printBorderMenuLine
   printEmptyBackgroundLine
   printEmptyBackgroundLine
   printBackgroundTopBottomGap

}


MenuComponent \
"MENU ITEM #1" \
"MENU ITEM #2" \
"MENU ITEM #3qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq" \
"MENU ITEM #4" \
"MENU ITEM #5" \
"MENU ITEM #6" \
false \
false \
false \
"6" \
"MENU TITLE11111111111111111111111111111111111111111111111111111111"

PageComponent \
"THIS IS A CONTERNT FOR LINE #1" \
"" \
"THIS IS A CONTERNT FOR LINE #2" \
"" \
"" \
"" \
"THIS IS A CONTERNT FOR LINE #4" \
"" \
"THIS IS A CONTERNT FOR LINE #5" \
"THIS IS A CONTERNT FOR LINE #6" \
"THIS IS A CONTERNT FOR LINE #7" \