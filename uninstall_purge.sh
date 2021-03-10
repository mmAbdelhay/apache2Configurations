#!/bin/bash
#script contains two files to unistall apache2 or uninstall it alongside all configuration files

#function to uninstall apache2 from your machine#
function uninstall(){
    sudo apt remove apache2
    sudo apt autoremove
    echo "apache2 removed successfully"
}
#===============================================#

#function to uninstall apache2 from your machine with all configuration files#
function purge(){
    sudo apt purge apache2
    sudo apt autoremove
    echo "apache2 and its configuration files removed successfully"
}
#=============================================================================#