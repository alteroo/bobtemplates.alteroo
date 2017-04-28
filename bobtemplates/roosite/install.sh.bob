#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
source utils.sh
source spinner.sh
SPINNER_SYMBOLS="WIDE_UNI_GREYSCALE"

virtualenv venv
ln -sf develop.cfg buildout.cfg
venv/bin/python bootstrap-buildout.py
spinner &
bin/buildout -qq 
touch stopspinning
echo "----> Adding a Plone site"
bin/instance run scripts/addSite.py Plone 
if [ $? -gt 0 ]; then
	    e_error "There was a problem during installation"
	    echo    "      Go to your buildout folder ($DIR)"
            echo    "      and try running the 'bin/buildout' command"
		    exit 1
	    fi

clear
         
e_header "==============="
echo " "
echo "__________                    .__  __    "      
echo "\______   \ ____   ____  _____|__|/  |_  ____  "
echo " |       _//  _ \ /  _ \/  ___/  \   __\/ __ \ "
echo " |    |   (  <_> |  <_> )___ \|  ||  | \  ___/ "
echo " |____|_  /\____/ \____/____  >__||__|  \___  >"
echo "        \/                  \/              \/ "
echo " "
e_header "You're all set!"
echo " "
echo "Congrat! You've setup a Plone dev environment at $DIR"
echo " "
echo "To get started, run the following commands"
echo " "
echo "   cd $DIR"
echo "   bin/instance fg"
echo " "
echo "Once it has started, visit your new site at http://localhost:8080"
echo " "
echo "Your login credentials are admin:admin"
echo " "
