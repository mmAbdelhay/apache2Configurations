#!/bin/bash
#script for installing apache2 web server for the first time and reinstalling it

#function to install apache2 for the very first time#
function install_first_time(){
    sudo apt update
    sudo apt install apache2
    sudo service apache2 start
    echo "apache2 installed successfully"
}
#====================================================#

########### function to reinstall apache2 ############
function reinstall(){
    sudo apt update
    sudo apt reinstall apache2
    sudo service apache2 start
    echo "apache2 reinstalled successfully"
}
#=====================================================#
