#!/bin/bash
source ./colors.sh



#1 BACKGROUND
backgroundSymbol=' '
backgroundLength=80
backgroundColor=$blackBGD
backgroundLeftRightGap=2

#2 APP
emptyAppBackgroundLength=$(($backgroundLength-$backgroundLeftRightGap*2))
appLeftRightGap=2
appTextContentLength=$(($emptyAppBackgroundLength-$appLeftRightGap*2))
appBackgroundSymbol=' '
appBackgroundStyle=$greenBGD

titleStyle=$greenBGD$boldTE$underlinedTE$yellowTCD

itemStyle=$greenBGD$boldTE$grayTCDalmostWhite
activeItemStyle=$blueTCD$boldTE$cyanBGD$redTCD


#CALCULATIONS
textContentLength=$(($backgroundLength-$backgroundLeftRightGap*2-$appLeftRightGap*2))

textContentCutter(){
   local text="$1"
   local maxLength=$textContentLength
   if [ ${#text} -gt $maxLength ]; then
      echo "${text:0:maxLength}"
   else
      echo "$text"
   fi
}


