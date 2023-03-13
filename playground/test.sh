#!/usr/bin/bash
#MENU HELPER

command3(){
   echo "ssh slon@192.168.0.101"
}

ask(){
   read -p "enter something: " ans
   echo $ans
}


#command3 | sudo -E bash -
#command3 | bash 

ask(){
   read -p "Please enter $1" ans
   echo $ans
}


checkIfRoot(){
   currentUser=$(whoami)
  
   if [[ $currentUser == 'root' ]]; then
      echo "You are root - try to run the script as a regular user"
      return 0
   else
      echo "You are $(whoami) - I can continue"
   fi
}


connection(){
   checkIfRoot
   script="sudo -S cat /etc/fstab"
   user=$(ask "your user name: ")
   host="192.168.0.$(ask "server's IP address 192.168.0.")"
   hint='echo "Print next commands"'
   
   ssh -t $user@$host "$script;$hint;bash"
}

#ssh -t slon@192.168.0.101 "sudo apt update; bash"

#connection


testFunction(){
   currentUser=$(whoami)
   echo $currentUser
   if [[ $currentUser == 'root' ]]; then
      return 0
   else
      return 1
   fi
}

check(){

   if [[ $result -eq 0 ]]; then
         echo "ZERO"
      else
         echo "1"
   fi
}

dostuff(){
   echo "executing commands for non root user"
}


anotherTest(){
   currentUser=$(whoami)
   if [[ $currentUser == 'root' ]]; then
      echo "Ooops - you are root"
   else
      echo "ALL GOOD YOU aren't root"
      $1
   fi
}


someFunc(){
   anotherTest dostuff
   echo "next command"
}

someFunc
