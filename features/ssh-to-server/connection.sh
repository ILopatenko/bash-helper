#CONSTANTS
oracleDefaultPath='/home/slon/Storage/ssd2terIT/__/keys/oracle/'
oracleDefaultKey='oracle.key'
oracleDefauiltIPFileName='oracle-ip.txt'

updateUpgradeCommand='sudo apt update && sudo apt upgrade -y && sudo reboot'
installDockerCommand='curl -sSL https://get.docker.com | sh && sudo usermod -aG docker $(whoami) && sudo reboot'
installDockerStackCommand='wget https://gitlab.com/bmcgonag/docker_installs/-/raw/main/install_docker_nproxyman.sh && chmod +x ./install_docker_nproxyman.sh && ./install_docker_nproxyman.sh && rm ./install_docker_nproxyman.sh && sudo reboot'




#VARIABLES

#CORE HELPERS
checkFolderExists(){
   local path=$1
   if [[ -d $path && -e $path ]]; then
      echo 'PASS'
   else
      echo 'FAIL'
   fi
}

checkFileExists(){
   local path=$1
   if [[ -f $path && -e $path ]]; then
      echo 'PASS'
   else
      echo 'FAIL'
   fi
}

checkIsFileNotEmpty(){
   local path=$1
   if [[ -s $path ]]; then
      echo 'PASS'
   else
      echo 'FAIL'
   fi
}

getFilePermission(){
   local fullFulePath=$1
   local permissionLine=$(stat -c "%a %n" $fullFulePath)
   echo ${permissionLine:0:4}
}

checkFilePermission(){
   local actual=$(getFilePermission $1)
   if [[  $actual == $2 ]]; then
      echo 'PASS'
   else
      echo 'FAIL'
   fi
}

changePermission(){
   chmod $1 $2
}



#FUNCTIONAL HELPERS
checkOracleFolderExists(){
   checkFolderExists $oracleDefaultPath
}

checkOracleKeyExists(){
   checkFileExists $oracleDefaultPath$oracleDefaultKey
}

checkOracleKeyIsNotEmpty(){
   checkIsFileNotEmpty $oracleDefaultPath$oracleDefaultKey
}

checkOracleIPFileExists(){
   checkFileExists $oracleDefaultPath$oracleDefauiltIPFileName
}

checkOracleIPFileIsNotEmpty(){
   checkIsFileNotEmpty $oracleDefaultPath$oracleDefauiltIPFileName
}

prepareConnection(){
   clear -x
   echo 'Server connection script'
   sleep 0.5

   echo
   echo '1. Checking default folder exists'
   sleep 0.5
   if [[  $(checkOracleFolderExists) == 'PASS' ]]; then
      echo '   YES. Default folder was found'
      sleep 0.5
   else
      echo '   NO. Default folder was not found. Plese use a custom key. Bye!'
      sleep 0.5
      exit
   fi
   sleep 0.5

   echo
   echo '2. Checking file with default IP exists'
      sleep 0.5
   if [[  $(checkOracleIPFileExists) == 'PASS' ]]; then
      echo '   YES. File with default IP was found'
      sleep 0.5
   else
      echo '   NO. File with default IP was not found. Plese use a custom IP. Bye!'
      sleep 0.5
      exit
   fi
   sleep 0.5

   echo
   echo '3. Checking file with default IP is not empty'
      sleep 0.5
   if [[  $(checkOracleKeyIsNotEmpty) == 'PASS' ]]; then
      echo '   YES. File with default IP is not empty'
      sleep 0.5
   else
      echo '   NO. File with default IP is empty. Plese use custom IP. Bye!'
      sleep 0.5
      exit
   fi
   sleep 0.5

   echo
   echo '4. Checking Private Key exists'
   sleep 0.5
   if [[  $(checkOracleKeyExists) == 'PASS' ]]; then
      echo '   YES. Private Key was found'
      sleep 0.5
   else
      echo '   NO. Private Key was found. Plese use custom key. Bye!'
      sleep 0.5
      exit
   fi
   sleep 0.5

   echo
   echo '5. Checking Private Key is not empty'
   sleep 0.5
   if [[  $(checkOracleKeyIsNotEmpty) == 'PASS' ]]; then
      echo '   YES. Private Key is not empty'
      sleep 0.5
   else
      echo '   NO. Private Key is empty. Plese use custom key. Bye!'
      sleep 0.5
      exit
   fi

   echo
   echo '6. Checking Private Key permissions'
   sleep 0.5
   if [[  $(checkFilePermission $oracleDefaultPath$oracleDefaultKey 400) == 'PASS' ]]; then
      echo '   YES. Private Key is ready'
      sleep 0.5
   else
      echo '   NO. Private Key is not ready. I am going to change the permission'
      sleep 0.5
      changePermission 400 $oracleDefaultPath$oracleDefaultKey

      if [[  $(checkFilePermission $oracleDefaultPath$oracleDefaultKey 400) == 'PASS' ]]; then
         echo '   YES. I changed the permission'
         sleep 0.5
      else
         echo '   NO. I can not change the permission. Bye!'
         sleep 0.5
         exit
      fi
   fi


   

   sleep 0.5
   clear -x
   sleep 0.5
   echo
   echo 'It looks like everything is ready.'
   sleep 0.5
   echo
   echo 'Establish connection ...'
   sleep 0.5
}

serverSSHConnection(){
   prepareConnection
   ssh -o StrictHostKeyChecking=no -i $1 $2@$3 $4
}

connectionToOracleWithCommand(){
   serverSSHConnection $oracleDefaultPath$oracleDefaultKey ubuntu $(cat $oracleDefaultPath$oracleDefauiltIPFileName) "$1"
}

connectionToOracle(){
   connectionToOracleWithCommand
}

connectionToOracleUpdateUpgrateReboot(){
   connectionToOracleWithCommand "$updateUpgradeCommand"
}

connectionToOracleDockerInstallReboot(){
   connectionToOracleWithCommand "$installDockerCommand"
}
connectionToOracleDockerStackInstallReboot(){
   connectionToOracleWithCommand "$installDockerStackCommand"

}



fullProccess(){
   connectionToOracleUpdateUpgrateReboot
   sleep 100
   connectionToOracleDockerInstallReboot
   sleep 100
   connectionToOracleDockerStackInstallReboot
   sleep 60
   connectionToOracle
}




connectionToOracle


###PLAN:
#1. Check IP
#  1.1. Check IP file
#     1.1.1. Check default folder (if folder does not exists - quit)
#     1.1.2. Check file exists
#     1.1.3. Check IP file is not empty
#
#2. Check key
#  2.1. Check key file exists
#  2.2. Check key file permission
#     2.2.1. Change the permission
#3. Connect


