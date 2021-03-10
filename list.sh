#!/bin/bash
#script for listing all the virtual hosts

#function to just list all vhosts with all sepecs#
function list(){
    apache2ctl -S
}
#================================================#