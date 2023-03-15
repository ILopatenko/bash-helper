
#!/bin/bash
#FSTAB
disk=$1
user=$2

header="

#################################################################################################
#   AUTOMOUNT FOR $disk"

footer="#################################################################################################
"

addLocalDisk(){
   sudo echo "
$header
/dev/disk/by-uuid/$ID /home/$user/Storage/$disk auto nosuid,nodev,nofail,x-gvfs-show 0 0
$footer" >> /etc/fstab
}

addLANDisk(){
   sudo echo "
$header
192.168.0.$lastIPPart:/mnt/$diskName/$dataSetName /home/$user/Storage/$disk nfs defaults 0 0
$footer" >> /etc/fstab
}


if [[ $disk == "2TER" ]]; then
   ID="7A2590CDC3BE76D0"    
   addLocalDisk
fi

if [[ $disk == "860" ]]; then    
   ID="535AFF5B40052D09"    
   addLocalDisk
fi

if [[ $disk == "970-rest" ]]; then    
   ID="d6675341-6422-4c7c-afee-168440542329"    
   addLocalDisk
fi

if [[ $disk == "ryzen2ter" ]]; then    
   lastIPPart="201"
   diskName="ryzen2ter"  
   dataSetName="dataSetRyzen2ter"  
   addLANDisk
fi

if [[ $disk == "ryzen4ter" ]]; then    
   lastIPPart="201"
   diskName="ryzen4ter"  
   dataSetName="dataSetRyzen4ter"  
   addLANDisk
fi

if [[ $disk == "ssdIT" ]]; then    
   lastIPPart="200"
   diskName="ssd2terIT"  
   dataSetName="ssd2terITdataSet"  
   addLANDisk
fi

if [[ $disk == "ssdMedia" ]]; then    
   lastIPPart="200"
   diskName="ssd2terVideo"  
   dataSetName="ssd2terVideoDataSet"  
   addLANDisk
fi