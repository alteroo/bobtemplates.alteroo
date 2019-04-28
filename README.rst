roosite.launchkit
=====================

Before you start
----------------
Ensure that locales are properly setup on your machine.
For an Ubuntu/Debian machine you might do something like this::

    export LC_ALL="en_US.UTF-8"
    export LC_CTYPE="en_US.UTF-8"
    sudo dpkg-reconfigure locales

Quick Start
---------------
Make sure you have a few dependencies (curl and pip) installed
::

    sudo apt update
    sudo apt install curl python-pip git

Install the roosite launchkit with this command
::

    curl -L https://roosite.github.io | bash && source ~/.bashrc

On a day to day basis you can generate a new site using the command ``roosite project``. For example if you're doing a site for ACME ltd, you might name your project 'acme'
::

    roosite acme

This creates a directory called `acme.site`, change directory to the acme.site directory and initialize your new site.
::

    cd acme.site
    bash init.sh

If the initial build fails then run ``bin/buildout`` to attempt the build again.

Launch your new site
::

    bin/instance fg
    
Access your site on port 8080 by visiting http://localhost:8080 in your browser.

Learn more by reading the following documents:

`BACKGROUND <BACKGROUND.rst>`_

`INSTALL <INSTALL.rst>`_

`USAGE <USAGE.rst>`_
