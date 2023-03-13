#!/usr/bin/bash

checkIfCurrentUserIsRoot(){
   currentUser=$(whoami)
   if [[ $currentUser == 'root' ]]; then
      return 1
   else
      return 0
   fi
}


rootRule(){
   if checkIfCurrentUserIsRoot; then
      echo "NO. You aren't ROOT"
      $1
   else
      echo "YES. You are ROOT"
      $2
   fi
}

askYesNoQuestion(){
   while true; do
      read -p "$1" yn
      case $yn in
         [Yy]* ) return 0;;
         [Nn]* ) return 1;;
         * ) echo "Please answer Y or N.";;
      esac
   done
}


askYesNoQuestionWithActions(){
   if askYesNoQuestion "Would you like to $1? [y/n] "; then
      sleep 1
      $2
   else
      sleep 1
      $3
   fi
}

connectAll(){
   echo "Connectiong all the disks"
}

connectLocalDisks(){
   echo "Connectiong all the LOCAL disks"
   nfsDisks

}

connectNFSDisks(){
   echo "Connectiong all the NFS disks"
}

connectconnectRyzenShare(){
   echo "Connectiong Ryzen Share"
}



localDisks(){
   askYesNoQuestionWithActions "connect all the LOCAL Disks" connectLocalDisks nfsDisks
}

nfsDisks(){
   askYesNoQuestionWithActions "connect all the NFS Disks" connectNFSDisks ryzenShare
}

ryzenShare(){
   askYesNoQuestionWithActions "connect only Ryzen2Ter share" "connectRyzenShare"
}

connectDisks(){
   askYesNoQuestionWithActions "connect all the disks" connectAll localDisks
}




theMAINFunction(){
   rootRule connectDisks
   echo "rest of the tasks"
}

theMAINFunction