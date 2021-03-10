#!/bin/bash
#script contains 2 functions for enable and disable your site

############### enable site ###################
function enable_site(){
    read -p "Enter the site name : " sitename
    cd /etc/apache2/sites-available
    a2ensite $sitename.conf
    echo "Site enabled Successfully"
    service apache2 reload
}
#=============================================#

############## disable site ###################
function disable_site(){
    read -p "Enter the site name : " sitename
    cd /etc/apache2/sites-available
    a2dissite $sitename.conf
    echo "Site disabled Successfully"
    service apache2 reload
}
#=============================================#
