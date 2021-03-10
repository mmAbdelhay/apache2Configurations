#!/bin/bash

function enable_auth(){

    read -p "Enter the site name : " sitename
    read -p "Enter the host ip : " host
    name=/var/www/$sitename

    echo "Needing utils to allow authentication"
    echo "Will try to install utils"

    sudo apt-get update
    sudo apt-get install apache2-utils

    touch $name/.htpasswd
    read -p "Please set the user name : " username
    htpasswd $name/.htpasswd $username
    
    cp default-vhostwithAuth.conf /etc/apache2/sites-available/${sitename}withAuth.conf
    sed -i "s/example.local/$sitename/g" /etc/apache2/sites-available/${sitename}withAuth.conf
    sed -i "s/127.0.0.x/$host/g" /etc/apache2/sites-available/${sitename}withAuth.conf
    sed -i "s|example.dir|$name|g" /etc/apache2/sites-available/${sitename}withAuth.conf

    cp default-htaccess $name/.htaccess
    cd $name
    sed -i "s|example.dir|$name|g" .htaccess
    echo "changed successfully auth successfully"

    echo "will Restart apache2"
    service apache2 reload 
}

function disable_auth(){

    read -p "Enter the site name : " sitename
    name=/var/www/$sitename
    sudo rm /etc/apache2/sites-available/${sitename}withAuth.conf
    sudo rm $name/.htaccess $name/.htpasswd
    service apache2 reload
    echo "authentication disabled successfully"
}


