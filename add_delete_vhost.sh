#!/bin/bash

function add_vhost(){
    read -p "Enter the site name : " sitename   #username
    read -p "Enter the host ip : " host         #127.0.0.X

    name=/var/www/$sitename
    mkdir /var/www/$sitename
    echo "Folder /var/www/$sitename created"
    cp default-index.html /var/www/$sitename/index.html
    echo "Intitialized with index page"

    cp default-vhost.conf /etc/apache2/sites-available/$sitename.conf
    cd /etc/apache2/sites-available/
    sed -i "s/example.local/$sitename/g" $sitename.conf
    sed -i "s/127.0.0.x/$host/g" $sitename.conf
    sed -i "s|example.dir|$name|g" $sitename.conf
    echo "Configuration files created"

    cd /etc/apache2/sites-available
    a2ensite $sitename.conf
    service apache2 reload
    echo "Restarted apache"
    echo "All done! Visit your newly created virtual host at https://$sitename"
}

function delete_vhost(){
    read -p "Enter the site name : " sitename
    cd /etc/apache2/sites-available/
    sudo rm $sitename.conf
    cd /var/www
    sudo rm -R $sitename
    echo "Deleted Successfully"
  
}