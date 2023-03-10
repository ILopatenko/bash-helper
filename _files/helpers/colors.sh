#!/usr/bin/bash
#COLORS
#https://misc.flogisoft.com/bash/tip_colors_and_formatting

#TEXT COLORS!
DefaultT="\e[39m"
BlackT="\e[30m"
RedT="\e[31m"
GreenT="\e[32m"
YellowT="\e[33m"
BlueT="\e[34m"
MagentaT="\e[35m"
CyanT="\e[36m"
GrayLT="\e[37m"
GrayDT="\e[90m"
RedLT="\e[91m"
GreenLT="\e[92m"
YellowLT="\e[93m"
BlueLT="\e[94m"
MagentaLT="\e[95m"
CyanLT="\e[96m"
WhiteLT="\e[97m"

#BACKGROUND COLORS
RedB="\e[41m"
RedLB="\e[101m"
GreenB="\e[42m"
GreenLB="\e[102m"
YellowB="\e[43m"
YellowLB="\e[103m"
BlueB="\e[44m"
BlueLB="\e[104m"
CyanB="\e[46m"
CyanLB="\e[106m"
GrayLB="\e[47m"
GrayDB="\e[100m"
MagentaB="\e[45m"
MagentaLB="\e[105m"
WhiteB="\e[107m"
BlackB="\e[40m"

#EFFECTS
reset="\e[0m"
resBlink="\e[25m"
bold="\e[1m"
underlined="\e[4m"
blink="\e[5m"
resUnd="\e[24m"

mainBG=${GrayDB}${bold}
menuT=${YellowLT}${underlined}
frame=${MagentaLT}${BlackB}
innerBG=${CyanB}
menuItem=${WhiteLT}

RESERVED="${GrayDT}${underlined}X.      RESERVED        ${resUnd}${innerBG}" 

choose=${MagentaLT}${bold}
confirmation=${YellowLT}${bold}

error=${RedLT}${bold}
info=${YellowLT}${bold}
good=${GreenLT}${bold}