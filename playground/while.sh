programm(){
   connectNFS
   connectToServer
}


connectNFS(){
   askYesNoQuestionWithActions "connect all the disks" connectAll
   askYesNoQuestionWithActions "connect local"
   askYesNoQuestionWithActions "connect NFS"
   askYesNoQuestionWithActions "connect only sharred"
}

connectAll(){
   echo "Connecting all the disks"
   
}

connectToServer(){
   echo "establish the connection..."
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



programm