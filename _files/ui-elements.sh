clear -x
#!/bin/bash
source ./colors.sh
source ./ui-settings.sh


# generateLineOfSymbolsWithStyle - this function takes in 3 parameters:
# - line length
# - symbol
# - style
# As a result this function returns (echo) prepared line
generateLineOfSymbolsWithStyle(){
   local result=""
   local length="$1"
   local symbol="$2"
   local style="$3"
   local i
   for ((i = 0; i < $1; i++)); do
    result+="$symbol"
   done
   printf "%b%s%b\n" $style"$result"$dropAllEffects
}


# generateTextLineWithStyle - this function takes in 2 parameters:
# - text content
# - style
# As a result this function returns (echo) prepared line
generateTextLineWithStyle(){
   local text="$1"
   local style="$2"
   printf "%b%s%b\n" $style"$text"$dropAllEffects
}


# PREPAIRED UI ELEMENTS
#1 BACKGROUND LINE
backgroundLine=$(generateLineOfSymbolsWithStyle $backgroundLength "$backgroundSymbol" $backgroundColor)

#2 UI PARTS
backgroundGap=$(generateLineOfSymbolsWithStyle $backgroundLeftRightGap "$backgroundSymbol" $backgroundColor)
appGap=$(generateLineOfSymbolsWithStyle $appLeftRightGap "$appBackgroundSymbol" $appBackgroundStyle)
leftPart="$backgroundGap$appGap"
rightPart="$appGap$backgroundGap"
emptyLineContent=$(generateLineOfSymbolsWithStyle $appTextContentLength "$appBackgroundSymbol" $appBackgroundStyle)
emptyLine="$leftPart$emptyLineContent$rightPart"

#PRINT UI ELEMENTS
printHeader(){
   echo -e "$backgroundLine"
   echo -e "$emptyLine"
   echo -e "$emptyLine"
}

printFooter(){
   echo -e "$emptyLine"
   echo -e "$backgroundLine"
}

printEmptyAppLine(){
   echo -e "$emptyLine"
}






#3 TEXT CONTENT LINE
# textContentLineWithStyle() takes in 2 parameters:
# - text
# - style
# As a result this function returns (echo) prepared text content line (with possible paddings and cutteted text)
textContentLineWithStyle(){
   local text="$1"
   local style="$2"
   local result=""
   #1 Check if text is longer than allowed
   if [ ${#text} -gt $textContentLength ]; then
      text=$(textContentCutter "$text")
   fi
   local textContentStyled=$(generateTextLineWithStyle "$text" "$style")
   if [ ${#text} -eq $textContentLength ]; then
      echo -e "$leftPart$textContentStyled$rightPart"
      else 
      local totalPaddingLength=$(($textContentLength-${#text}))
      local leftPaddingLength=$(($totalPaddingLength/2))
      local rightPaddingLength=$(($totalPaddingLength-$leftPaddingLength))

      local leftPadding=$(generateLineOfSymbolsWithStyle $leftPaddingLength ' ' "$appBackgroundStyle")
      local rightPadding=$(generateLineOfSymbolsWithStyle $rightPaddingLength ' ' "$appBackgroundStyle")
      echo -e "$leftPart$leftPadding$textContentStyled$rightPadding$rightPart"
   fi
}


printMenuTitle(){
   local title="$1"
   local result=$(textContentLineWithStyle "$title" "$titleStyle")
   echo -e "$result"
   printEmptyAppLine
}

printMenuItem(){
   local title="$1"
   local result=$(textContentLineWithStyle "$title" "$itemStyle")
   echo -e "$result"
   printEmptyAppLine
}

printMenuActiveItem(){
   local title="$1"
   local result=$(textContentLineWithStyle "$title" "$activeItemStyle")
   echo -e "$result"
   printEmptyAppLine
}



pageContent=('WELCOME TO THE APPLICATION' 'THIS IS A MENU ITEM. IT MAY BE VERY LONG OR SHORT. sdsfsdffsdffs' 'SECOND MENU ITEM' 'THIRD MENU ITEM' 'FOURTH MENU ITEM' 'FIFTH MENU ITEM' 'SIXTH MENU ITEM' 'SEVENTH MENU ITEM')

activeMenuItem=1




printTestPage(){
   printHeader
   printMenuTitle "$1"
   printEmptyAppLine
   printMenuItem "$2"
   printEmptyAppLine
   printMenuItem "$3"
   printEmptyAppLine
   printMenuItem "$4"
   printEmptyAppLine
   printMenuItem "$5"
   printEmptyAppLine
   printMenuItem "$6"
   printEmptyAppLine
   printMenuItem "$7"
   printFooter
}


printMenu(){
   local menuItems=("$@")
   printHeader
   printMenuTitle "${menuItems[0]}"
   for ((i=1; i<${#menuItems[@]}; i++)); do
   if [ $i -eq $activeMenuItem ]; then
         printMenuActiveItem "${menuItems[i]}"
      else 
         printMenuItem "${menuItems[i]}"
   fi
   done
   printFooter
}


printMenu "${pageContent[@]}"



