#!/bin/bash
# ACTIONS HELPER

updateUpgradeUbuntu(){
   clear -x
   sudo apt update && sudo apt upgrade -y
   sleep 1
}


installInitialServerSoft(){
   clear -x
   sudo apt install git nano htop openssh-server nfs-common wget iperf3 -y
   sleep 1
}

installDockerStack(){
   clear -x
   wget https://gitlab.com/bmcgonag/docker_installs/-/raw/main/install_docker_nproxyman.sh
   chmod +x ./install_docker_nproxyman.sh
   ./install_docker_nproxyman.sh
   rm ./install_docker_nproxyman.sh
   sleep 1
}






#FOR CONNECT MENU
connectToLanProxmoxServer(){
   clear -x
   read -p "PLEASE ENTER THE LAST PART OF THE LAN PROXMOX SERVER: 3.3.3." ip
   ssh -i /home/slon/Storage/r4ter-it/_SSH-keys/lan/slon-pm/slon-pm -o StrictHostKeyChecking=no slon@3.3.3.$ip
}



#FOR NFS MENU
connectNFS(){
   params=("$@")
   trueNasName=''
   trueNasIp=''
   pool=''
   dataSet=''
   mountFolder=''
   user="slon"

   for ((i = 0 ; i < ${#params[@]} ; i++)); do
      echo "${params[i]}"
      if [[ ${params[$i]} == "ssd-it" ]]; then
         trueNasName='DELL'
         trueNasIp='201'
         pool='ssd2terIT'
         dataSet='ssd2terITdataSet'
         mountFolder='ssd-it'
         
      elif [[ ${params[$i]} == "ssd-media" ]]; then
         trueNasName='DELL'
         trueNasIp='201'
         pool='ssd2terVideo'
         dataSet='ssd2terVideoDataSet'
         mountFolder='ssd-media'

      elif [[ ${params[$i]} == "r2ter-share" ]]; then
         trueNasName='RYZEN'
         trueNasIp='51'
         pool='r2ter1'
         dataSet='r2ter1ds'
         mountFolder='r2ter-share'

      elif [[ ${params[$i]} == "r2ter-media" ]]; then
         trueNasName='DELL'
         trueNasIp='51'
         pool='r2ter2'
         dataSet='r2ter2ds'
         mountFolder='r2ter-media'

      elif [[ ${params[$i]} == "r4ter-it" ]]; then
         trueNasName='RYZEN'
         trueNasIp='51'
         pool='r4ter'
         dataSet='r4terds'
         mountFolder='r4ter-it'
      fi
   echo "

   #########################################################################################
   #
   # $mountFolder on $trueNasName
   #
   3.3.3.$trueNasIp:/mnt/$pool/$dataSet /home/$user/Storage/$mountFolder nfs defaults,retry=0 0 0
   #
   #########################################################################################

   " >> /etc/fstab

   done

}


connectAllNfsShares(){
   connectNFS "ssd-it" "ssd-media" "r2ter-share" "r2ter-media" "r4ter-it"
}