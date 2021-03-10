#!/bin/bash
#main script for the project
#project allow the user to install and taking full control about his apache2 server
#hope you enjoy it <3
#exit 1 : run main without sudo privileges

if [ "$EUID" -ne 0 ]
  then echo "Please run as root or just use sudo"
  exit 1
fi

#loading project required files for our project
source add_delete_vhost.sh
source enable_disable_auth.sh
source enable_disable_site.sh
source install_reinstall.sh
source uninstall_purge.sh
source list.sh

############## lets start our main menu #################################
PS3='What do you think of ?! :: '
options=("install apache2 for the first time" "reinstall apache2" 
"uninstall apache2 with the configuration files" "uninstall apache2 only"
"list all vhosts" "add vhost" "delete vhost" "disable site" "enable site"
"enable authentication" "disable authentication" "Quit")

select opt in "${options[@]}"; do
	case $opt in
	"install apache2 for the first time")
		echo "installing ..."
		install_first_time
		;;
	"reinstall apache2")
		echo "reinstalling ..."
		reinstall
		;;
	"uninstall apache2 only")
		echo "uninstalling ..."
		uninstall
		;;
	"uninstall apache2 with the configuration files")
		echo "uninstalling ..."
		purge
		;;
	"list all vhosts")
		echo "List of all Vhosts ヽ(^o^)ノ"
		list
		;;
	"add vhost")
		echo "adding a new vhost (｡●́‿●̀｡)"
		add_vhost
		;;
	"delete vhost")
		echo "deleting your vhost (⌣́_⌣̀)"
		delete_vhost
		;;
	"disable site")
		echo "disabling your site (-_-;)"
		disable_site
		;;
	"enable site")
		echo "enabling your site ♥‿♥"
		enable_site
		;;
	"enable authentication")
		echo "trying to add an authentication for your vhost give us a sec (❣◡❣)"
		enable_auth
		;;
	"disable authentication")
		echo "disabling authentication for your host へ(◎_◎)へ"
		disable_auth
		;;
	"Quit")
		echo "bye (　-_･) ︻デ═一  ▸"
		break
		;;
	*) echo "invalid option $REPLY" ;;
	esac
done
