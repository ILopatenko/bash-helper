#!/bin/bash

source ./_files/helpers/colors.sh
source ./_files/actions/actionHandlers.sh



#UI PARTS AND VARIABLES/CONSTANTS

##BLACK BACKGROUND
blackBackgroundColor=$blackBGD
blackBackgroundLength=71
blackBackgroundGapLength=5

##FRAME
frameBackgroundColor=$magentaBGD
frameSymbolColor=$redTCD
frameTextStyle=$boldTE
frameWidth=3
frameFirstSymbol="X"
frameSecondSymbol=" "
frameStyle=$frameTextStyle$frameBackgroundColor$frameSymbolColor


##MENU
menuBackgroundColor=$cyanBGD
menuGapLength=1

##MENU
menuTitleBackgroundColor=$cyanBGD
menuTitleTextColor=$yellowTCD
menuTitleStyle=$boldTE$menuTitleBackgroundColor$menuTitleTextColor

menuItemBackgroundColor=$cyanBGD
menuItemTextColor=$grayTCLTalmostWhite
menuItemStyle=$boldTE$menuItemBackgroundColor$menuItemTextColor
menuActiveItemStyle=$boldTE$yellowBGD$blackTCD


##ARROW/SELECTOR
arrowColor=$redTCD
arrowBackgroundColor=$menuBackgroundColor
arrowStyle=$boldTE$arrowColor$arrowBackgroundColor$flashingTE
arrowLength=5
leftArrow="$arrowStyle ==> $dropAllEffects"
rightArrow="$arrowStyle <== $dropAllEffects"

activeItem=1
maxItems=7

delayForPages=2
delayForAction=2


actionHintInProgressStyle=$boldTE$menuBackgroundColor$flashingTE$yellowTCD
actionHintDoneStyle=$boldTE$menuBackgroundColor$greenTCD








#FUNCTIONS
##GENERATE A STYLED LINE
#$1 - length (for a frame it should be odd - 1,3,5 ...)
#$2 - odd symbol
#$3 - even symbol
#$4 - style
#example: genStyledLine 10 "X" "O" $blackBackgroundColor
genStyledLine(){
   line=''
   for ((i = 0 ; i < $1 ; i++)); do
      if [[ $((i%2)) -eq 0 ]]; then
         line+="$2"
      else
         line+="$3"
      fi
   done
   echo -e "$4$line$dropAllEffects"
}






#GENERATED UI PARTS
##BLACK BACKGROUND LINE
blackBackgroundLine=$(genStyledLine $blackBackgroundLength " " " " $blackBackgroundColor)

##BLACK BACKGROUND GAP (LEFT/RIGHT)
blackBackgroundGap=$(genStyledLine $blackBackgroundGapLength " " " " $blackBackgroundColor)

##FRAME BORDER
frameBorder=$(genStyledLine $frameWidth  "$frameSecondSymbol" "$frameFirstSymbol" $frameStyle)

##FRAME CENTRAL PART
frameCentralPartLength=$(($blackBackgroundLength-($blackBackgroundGapLength+$frameWidth)*2))
frameCentralPart=$(genStyledLine $frameCentralPartLength "$frameFirstSymbol" "$frameSecondSymbol" $frameStyle)

##LEFT PART: BLACK BACGROUND + FRAME BORDER
leftPart=$blackBackgroundGap$frameBorder
##RIGHT PART: FRAME BORDER + BLACK BACGROUND
rightPart=$frameBorder$blackBackgroundGap


##MENU EMPTY LINE
menuInnerEmptyLine=$(genStyledLine $frameCentralPartLength " " " " $menuBackgroundColor)

##MENU EMPTY GAP AFTER FRAME
menuGap=$(genStyledLine $menuGapLength " " " " $menuBackgroundColor)

##APP LEFT AND RIGHT PARTS FOR LINES WITH A TITLE AND/OR CONTENT
leftAppPart=$leftPart$menuGap
rightAppPart=$menuGap$rightPart

emptyPlaceholder=$(genStyledLine $arrowLength " " " " $menuBackgroundColor)


#UI HELPER FUNCTIONS
printAppLineWithContent(){
   style=''
   leftPlaceholder=$emptyPlaceholder
   rightPlaceholder=$emptyPlaceholder
   if [[ $2 -eq 1 ]]; then
      style=$menuTitleStyle
   elif [[ $2 -eq 2 ]]; then
      style=$menuItemStyle
   elif [[ $2 -eq 3 ]]; then
      style=$menuActiveItemStyle
      leftPlaceholder=$leftArrow
      rightPlaceholder=$rightArrow
   elif [[ $2 -eq 4 ]]; then
      style=$actionHintInProgressStyle
   elif [[ $2 -eq 5 ]]; then
      style=$actionHintDoneStyle

   fi
   content=$1
   contentLength=${#content}
   maxContentLength=$(($frameCentralPartLength-($menuGapLength+$arrowLength+1)*2))
   if [[ contentLength -ge  maxContentLength ]]; then
      cuttedContent=${content:0:maxContentLength}
      echo -e "$leftAppPart$leftPlaceholder$style $cuttedContent $dropAllEffects$rightPlaceholder$rightAppPart"
   fi
   if [[ contentLength -lt  maxContentLength ]]; then
      totalContrentGapLength=$(($maxContentLength-$contentLength))
      leftContentGapLength=$(($totalContrentGapLength/2))
      leftContentGap=$(genStyledLine $leftContentGapLength " " " " $menuBackgroundColor)
      rightContentGapLength=$(($totalContrentGapLength-$leftContentGapLength))
      rightContentGap=$(genStyledLine $rightContentGapLength " " " " $menuBackgroundColor)
      echo -e "$leftAppPart$leftContentGap$leftPlaceholder$style $content $dropAllEffects$rightPlaceholder$rightContentGap$rightAppPart"
   fi

}


#UI FUNCTIONS
printBlackBackgroundLine(){
   echo -e "$blackBackgroundLine"
}

printFrameLine(){
   echo -e "$leftPart$frameCentralPart$rightPart"
}

printMenuEmptyLine(){
   echo -e "$leftPart$menuInnerEmptyLine$rightPart"
}

printMenuTitle(){
   printAppLineWithContent "$1" 1
}

printMenuItem(){
   printAppLineWithContent "$1" 2
}


printMenuActiveItem(){
   printAppLineWithContent "$1" 3
}



#UI MINI COMPONENTS
printAppHeader(){
   printBlackBackgroundLine
   printBlackBackgroundLine
   printFrameLine
   printMenuEmptyLine
}

printMenuContent(){
   local localMenuContent=("$@")
   counter=1
   for ((i = 0 ; i <= $maxItems ; i++)); do
      if [[ $i -eq 0 ]]; then
         printMenuTitle "${localMenuContent[$i]}"
      else
         if [[ $counter -eq $activeItem ]]; then
            printMenuActiveItem "${localMenuContent[$i]}"
         else 
            printMenuItem "${localMenuContent[$i]}"
         fi
         counter=$(($counter+1))
      fi
      printMenuEmptyLine
   done






}

printAppFooter(){
   printMenuEmptyLine
   printFrameLine
   printBlackBackgroundLine
   printBlackBackgroundLine
}





sayHello(){
   echo "HELLO!"
   sleep 1
}

sayHi(){
   echo "Hi"
   sleep 1
}


#FINAL COMPONENT
MenuUIcomponent(){
   clear -x
   local localMenuItems=("$@")

   rerenderMenu(){
      MenuUIcomponent "${localMenuItems[@]}"
   }

   performAction(){
      index=$(($maxItems+$1))
      localMenuItems[$index]
   }

   arrowOnClickHandler(){
      if [[ $activeItem -gt $maxItems ]]; then
         activeItem=1
      elif [[ $activeItem -lt 1 ]]; then
         activeItem=$maxItems
      fi
   }


   printAppHeader
   printMenuContent "${localMenuItems[@]}"
   printAppFooter

   escape_char=$(printf "\u1b")
   read -rsn1 mode
   if [[ $mode == $escape_char ]]; then
      read -rsn2 mode 
   fi
   case $mode in
      'q') ${localMenuItems[-1]} ; exit ;;
      '[A') activeItem=$(($activeItem-1));
      arrowOnClickHandler;
      rerenderMenu ;;
      '[B') activeItem=$(($activeItem+1));
      arrowOnClickHandler;
      rerenderMenu ;;
      '') ${localMenuItems[$maxItems+$activeItem]}; rerenderMenu ;;
      *) >&2 echo 'ERR bad input'; return ;;
   esac
}



   
