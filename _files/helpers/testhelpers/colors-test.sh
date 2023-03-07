#!/usr/bin/bash
#THIS IS A TEST SCRIPT FOR COLORS
#echo -e {${NAME} This is NAME text color}

source ./../colors.sh

textColorsArray=('DefaultT' 'BlackT' 'RedT' 'GreenT' 'YellowT' 'BlueT' 'MagentaT' 'CyanT' 'GrayLT' 'GrayDT' 'RedLT' 'GreenLT' 'YellowLT' 'BlueLT' 'MagentaLT' 'CyanLT' 'WhiteLT')

backgroundColorsArray=('DefaultB' 'BlackB' 'RedB' 'GreenB' 'YellowB' 'BlueB' 'MagentaB' 'CyanB' 'GrayLB' 'GrayDB' 'RedLB' 'GreenLB' 'YellowLB' 'BlueLB' 'MagentaLB' 'CyanLB' 'WhiteLB')

echoExample(){
   declare -n prop1=$1
   echo -e "$prop1 This is $1 $2${reset}"
}

testTextColors(){
   echo -e "${reset}HERE ARE EXAMPLES OF DIFFERENT TEXT COLORS"
   for i in "${textColorsArray[@]}"; do
   echoExample $i "text color"
   done
}

testBackgroundColors(){
   echo -e "${reset}HERE ARE EXAMPLES OF DIFFERENT BACKGROUND COLORS"
   for i in "${backgroundColorsArray[@]}"; do
   echoExample $i "background color"
   done
}

testTextBackgroundCombinations(){
   echo -e "${reset}HERE ARE EXAMPLES OF DIFFERENT TEXT COLORS ON DIFFERNENT BACKGROUND COLORS"
   for i in "${textColorsArray[@]}"; do
   echo ""
   echo -e "TEXT COLOR IS $i"
      for j in "${backgroundColorsArray[@]}"; do
      declare -n textColor=$i
      declare -n backgroundColor=$j
      testStyle=$textColor$backgroundColor$bold$underlined
      echo -e "$testStyle Some $i text on $j background + BOLD + UNDERLINED${reset}"
      done
   done
}

testTextColors
testTextBackgroundCombinations


