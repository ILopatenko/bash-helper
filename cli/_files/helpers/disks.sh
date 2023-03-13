#!/bin/bash
#DISKS

source ./_files/helpers/questions.sh
source ./_files/helpers/actions.sh


checkFolderStorage(){
   if [ -d "/home/$USER/Storage" ]; then
      echo -e "${info} folder /home/$USER/Storage exists!"
   else
      echo -e "${info} trying to create /home/$USER/Storage"
      mkdir "/home/$USER/Storage"
      if [ -d "/home/$USER/Storage" ]; then
         echo -e "${good} folder /home/$USER/Storage was created!"
      else
         echo -e "${error} can not create folder /home/$USER/Storage!" 
      fi
   fi
}

createFolderForMount(){
   if [ -d "/home/$USER/Storage/$1" ]; then
   echo -e "${info} folder /home/$USER/Storage/$1 exists!"
   else
   echo -e "${info} trying to create /home/$USER/Storage/$1"
      mkdir "/home/$USER/Storage/$1"
      if [ -d "/home/$USER/Storage/$1" ]; then
         echo -e "${good} folder /home/$USER/Storage/$1 was created!"
      else
         echo -e "${error} can not create folder /home/$USER/Storage/$1!" 
      fi
   fi

}


connectRyzenShare(){
   connectHelper "ryzen2ter"
}

ryzenShare(){
   askYesNoQuestionWithActions "connect only Ryzen2Ter share" "connectRyzenShare"
}

connectNFSDisks(){
   NFSDisks="ryzen2ter ryzen4ter ssdIT ssdMedia"
   connectHelper "$NFSDisks"
}

nfsDisks(){
   askYesNoQuestionWithActions "connect all the NFS Disks" connectNFSDisks ryzenShare
}


connectLocalDisks(){
   localDisks="2TER 860 970-rest"
   connectHelper "$localDisks"
   nfsDisks
}

localDisks(){
   askYesNoQuestionWithActions "connect all the LOCAL Disks" connectLocalDisks nfsDisks
}

doFullMount(){
   createFolderForMount $1 $(whoami)
   sudo bash ./_files/helpers/fstab.sh $1 $(whoami)
}

connectHelper(){
   for DISK in $1
      do doFullMount $DISK
      reportOK "$DISK was added!"
      sleep 0.5
   done
   reportOK "All the disks were added!"
   sleep 1
}

connectAll(){
   allDisks="2TER 860 970-rest ryzen2ter ryzen4ter ssdIT ssdMedia"
   connectHelper "$allDisks"
}

#MAIN FUNCTION!
connectDisks(){
   if checkIfCurrentUserIsRoot; then
      #Check if /home/$USER/Storage folder exists. If  doesn't - create
      checkFolderStorage
      #Ask user to connect all the disks. Y - invokes connectAll() and N - invokes localDisks()
      askYesNoQuestionWithActions "connect all the disks" connectAll localDisks
   fi
}