#!/bash/sh -e

username=
home=

completion_ignore_case=false
ssh=false
emacs=false
aliases=false
general_tools=false

usage() {
    cat <<EOF
-u username
-h help
EOF
}

options="u:h"
while getopts $options option
do
    case $option in
        u) username=$OPTARG; home="/home/$username/"; exit;;
        h) usage; exit;;
    esac
done

##########################################
# Terminal Case Insensitive Autocomplete #
##########################################

if $completion_ignore_case; then
    sudo echo "set completion-ignore-case On" >> /etc/inputrc
    echo "Terminal case insensitive autocomplete done !!!"
fi

###############################
# SSH Installation and config #
###############################

if $ssh; then
    
    if [ ! -f ./banner ]; then
        echo "File ./banner not found XXX";
        echo "SSH installation and configuration failed ...";
        exit 1
    fi
    
    sudo apt-get install -y openssh-server openssh-client
    sudo cp ./banner /etc/ssh/banner
    sudo echo "Banner /etc/ssh/banner" >> /etc/ssh/sshd_config
    echo "SSH installation and config done !!!"
fi    

############
# Emacs 24 #
############

if $emacs; then

    if [ ! -f ./emacs ]; then
        echo "File ./emacs not found XXX";
        echo "Emacs installation and configuration failed ..."
        exit 1
    fi
    
    sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg
    
    sudo cp ./emacs $home/.emacs
    sudo chown $username:$username $home/.emacs
    sudo chmod 755 $home/.emacs

    sudo ln -s $home/.emacs /root/.emacs
    
    echo "Emacs installation and configuration done !!!"
fi

################
# Bash Aliases #
################

if $aliases; then

    if [ ! -f ./aliases ]; then
        echo "File ./aliases not found XXX";
        echo "Bash aliases configuration failed ...";
        exit 1
    fi

    sudo cat ./aliases >> /etc/bash.bashrc
fi

#################
# General tools #
#################

if $general_tools; then
    sudo apt-get install -y htop tree
    echo "General tools installation done !!!"
fi
