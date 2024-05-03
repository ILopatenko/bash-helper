#!/bin/bash

source ./_files/actions/commands.sh


standartActionHandler(){
   actionHintInProgress "$1"
   sleep $delayForAction
   updateUpgradeSystemCommand
   actionHintDone "$2"
   sleep $delayForAction
}



updateUpgradeSystemHandler(){
   standartActionHandler "$updateUpgradeSystemPageHintInProgress" "$updateUpgradeSystemPageHintFinished"
}
 