#!/bin/bash
# UI MENU HELPER
source ../helpers/colors.sh




#VALUES
#WIDHT
backgroundWidth=85
backgroundColor=$blueBGD
backgroundLeftGap=4
backgroundTopBottomGap=2
borderSymbol="O"
menuGap=5
menuInnerGap=3
menuBackground=$cyanBGD
borderBackground=$magentaBGD
borderSymbolColor=$yellowTCD
borderStyle="$borderBackground$borderSymbolColor$boldTE"
borderMenuStringLength=$(($backgroundWidth - $menuGap - $menuGap))
innerMenuStringLength=$(($borderMenuStringLength - $menuInnerGap - $menuInnerGap - 2))








#HELPERS
# getString() - takes in 3 parameters: $1 - length, $2 - Symbol, $3 - style
# returns a sting with length $1 that consists of $2 Symbols with $3 style, and drops all the styles
getString(){
   string=''
   for ((i = 0 ; i < $1 ; i++)); do
      string+="$2"
   done
   echo "$3$string$dropAllEffects"
}

printBackgroundTopBottomGap(){
   for ((i = 0 ; i < $backgroundTopBottomGap ; i++)); do
      echo
   done
}


# getEmptyBackgroudString() - returns a string with length $backgroundWidth that consists of SPACES and has $backgroundColor style
getEmptyBackgroudString(){
   echo "$(getString $backgroundWidth " " $backgroundColor)"
}

emptyBackgroundString="$(getEmptyBackgroudString)"
backgrounGapString="$(getString $backgroundLeftGap " " $dropAllEffects)"

printEmptyBackgroundString(){
   echo -e "$backgrounGapString$emptyBackgroundString"
}

###

getBorderMenuString(){
   echo "$(getString $borderMenuStringLength $borderSymbol $borderStyle)"
}

borderString="$(getBorderMenuString)"
menuGapString="$(getString $menuGap " " $backgroundColor)"

printBorderString(){
   echo -e "$backgrounGapString$menuGapString$borderString$menuGapString"
}

###
innerMenuGap="$(getString $menuInnerGap " " $menuBackground)"
leftInnerMenuString="$backgrounGapString$menuGapString$borderStyle$borderSymbol$innerMenuGap"
rightInnerMenuString="$innerMenuGap$borderStyle$borderSymbol$menuGapString$backgrounGapString"
innerEmptyMenuString="$(getString $innerMenuStringLength " " $menuBackground)"

printMenuLine(){
   echo -e "$leftInnerMenuString$menuBackground$2$1$rightInnerMenuString"
}


printEmptyMenuLine(){
   printMenuLine "$innerEmptyMenuString"
}









MenuComponent(){
   clear -x
   printBackgroundTopBottomGap
   printEmptyBackgroundString
   printEmptyBackgroundString
   printBorderString
   printEmptyMenuLine
   printMenuLine "dfgdfgdfg"
   printEmptyMenuLine
   printBorderString
   printEmptyBackgroundString
   printEmptyBackgroundString
   printBackgroundTopBottomGap

}






MenuComponent







#################################


getStringWithParameters(){
   string=''
   for ((i = 0 ; i < $1 ; i++)); do
      string+="$2"
   done
   echo "$3$string$dropAllEffects"
}

backgroundLeftGapString=$(getStringWithParameters $backgroundLeftGap " " $dropAllEffects)
menuGapString=$(getStringWithParameters $menuGap " " $backgroundColor)
innerStringForBackground=$(getStringWithParameters $menuGap " " $backgroundColor)