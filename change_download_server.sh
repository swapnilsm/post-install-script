#!/bin/sh -e
if [ "$1" = "iitk" ]; then
    sudo sed -i s:"np.archive.ubuntu.com":"mirror.cse.iitk.ac.in": /etc/apt/sources.list
    sudo sed -i s:"in.archive.ubuntu.com":"mirror.cse.iitk.ac.in": /etc/apt/sources.list    
else
    sudo sed -i s:"mirror.cse.iitk.ac.in":"np.archive.ubuntu.com": /etc/apt/sources.list
    sudo sed -i s:"in.archive.ubuntu.com":"np.archive.ubuntu.com": /etc/apt/sources.list    
fi
sudo apt-get update
