#!/bin/bash
# UI MENU HELPER
source ./_files/pages/ErrorPagesWithExplanation.sh

source ./_files/helpers/colors.sh
source ./_files/helpers/actions.sh


backgroundWidth=67
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

cliQuestionStyle=$boldTE$blackTCD$yellowTCD
questionCLI="          PLEASE SELECT THE NEXT ACTION (1-9): "
#!/bin/bash
# THIS FEATURE IS IN DEVELOPMENT PAGE

printWrongSelectionPage(){
   PageComponent \
      false \
      false \
      "UNFOURTINATELY $1" \
      false \
      "IS A WRONG SELECTION" \
      false \
      "PLEASE SELECT ANOTHER VARIANT!" \
      false \
      false \
      false \
      "*!PREVIOUS MENU WILL BE LOADED IN 2 SECONDS!*"
      
      sleep 1
}

printInDevelopmentPage(){
   PageComponent \
      false \
      false \
      "UNFOURTINATELY AT THE MOMENT" \
      false \
      "THIS FEATURE IS IN DEVELOPMENT" \
      false \
      "PLEASE SELECT ANOTHER VARIANT!" \
      false \
      false \
      false \
      "*!PREVIOUS MENU WILL BE LOADED IN 2 SECONDS!*"
      
      sleep 1
}

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

printTopMenuPart(){
   printBackgroundTopBottomGap
   printEmptyBackgroundLine
   printEmptyBackgroundLine
   printBorderMenuLine
   printEmptyMenuLine
}

printBottomMenuPart(){
   printEmptyMenuLine
   printBorderMenuLine
   printEmptyBackgroundLine
   printEmptyBackgroundLine
}


MenuComponent(){
   params=("$@")
   clear -x
   printTopMenuPart
   printMenuLineTitle "${params[-2]}" "${params[-1]}"
   printEmptyMenuLine
   for ((i = 1 ; i < ${#params[@]}-1 ; i++)); do
      if [[ ${params[$i-1]} == "false" ]]; then
         printMenuLineReserved "${params[-2]}.$i"
      else
         printMenuLineItem "${params[-2]}.$i" "${params[$i-1]}"
      fi
   done
   printBottomMenuPart
}




PageComponent(){
   params=("$@")
   clear -x
   printTopMenuPart
   for ((i = 1 ; i < ${#params[@]}+1 ; i++)); do
      if [[ ${params[$i-1]} == "false" ]]; then
         printEmptyMenuLine
      else
         printMenuLineItem "${params[$i-1]}"
      fi
   done
   printBottomMenuPart
   sleep 1
}




CLIselector(){
   echo -e "$cliQuestionStyle"
   read -p "$questionCLI" ans
   echo -e "$dropAllEffects"
      case $ans in
        1) $1;${12};;
        2) $2;${12};;
        3) $3;${12};;
        4) $4;${12};;
        5) $5;${12};;
        6) $6;${12};;
        7) $7;${12};;
        8) $8;${12};;
        9) $9;${12};;
        q) ${10};;
        *) ${11} "$ans";${12};;
      esac
}








