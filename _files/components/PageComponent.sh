#!/bin/bash

source ./_files/components/MenuComponent.sh






PageComponent(){
   clear -x
   local localPageContent=("$@")
   printAppHeader
   for ((i = 0 ; i <= $maxItems ; i++)); do
      printMenuTitle "${localPageContent[$i]}"
      printMenuEmptyLine
   done
   printAppFooter
}


ActionHint(){
   clear -x
   printAppHeader
   printMenuEmptyLine
   printMenuEmptyLine
   printMenuEmptyLine
   printMenuEmptyLine
   printMenuEmptyLine
   printMenuEmptyLine
   printMenuEmptyLine
   printAppLineWithContent "$1" $2
   printMenuEmptyLine
   printMenuEmptyLine
   printMenuEmptyLine
   printMenuEmptyLine
   printMenuEmptyLine
   printMenuEmptyLine
   printMenuEmptyLine
   printMenuEmptyLine
   printAppFooter
}

actionHintInProgress(){
   ActionHint "$1" 4
}

actionHintDone(){
   ActionHint "$1" 5
}








