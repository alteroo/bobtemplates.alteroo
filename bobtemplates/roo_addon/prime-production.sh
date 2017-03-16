#!/bin/bash
# minmem is the minimum we'll work with
# basemem is the minimum amount that needs no swapfile
minmem='500000'
basemem='1000000'
memtotal=$(cat /proc/meminfo |grep MemTotal |cut -c19- |cut -d' ' -f1)
echo "found $memtotal kB of memory"
if [ $memtotal -gt $minmem ];
then
   echo "there's enough memory"
else
   echo "not enough memory, you need at least 512MB to run Plone"
   exit 1
fi
# spinner borrowed from http://fitnr.com/showing-a-bash-spinner.html

PLONE_VERSION=5.1a2
PLONE_MAJOR_VERSION=$(echo $PLONE_VERSION | cut -d. -f1).$(echo $PLONE_VERSION | cut -d. -f2)
INSTALLERFILE=Plone-${PLONE_VERSION}-UnifiedInstaller.tgz
INSTALLERFOLDER=Plone-${PLONE_VERSION}-UnifiedInstaller
INSTALLERURL=https://launchpad.net/plone/${PLONE_MAJOR_VERSION}/${PLONE_VERSION}/+download/Plone-${PLONE_VERSION}-UnifiedInstaller.tgz

if [ -z ${C9_USER+x} ]; then
     echo "----> This is not a C9 based install, this doesn't always work";
     BUILDOUTDIR=$HOME/plone
else
     echo "----> This is a C9 install. Hi '$C9_USER'";
     BUILDOUTDIR=$HOME/workspace
fi
echo "Your primed buildout directory will be $BUILDOUTDIR"
echo "Please DO NOT DELETE"


spinner()
{
    local pid=$1
    local delay=0.75
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}
if [ ! -f $HOME/.python-gitlab.cfg ]; then
echo "getting the installer"
if [ -s $INSTALLERFILE ]  
then  
    echo "----> We already have the installer file"
else  
    echo "----> Downloading the installer file"
    wget $INSTALLERURL
fi
echo "unpacking the installer"
tar xfz $INSTALLERFILE
cd $INSTALLERFOLDER


echo "installing (best effort)"
./install.sh standalone --target=$BUILDOUTDIR &
spinner $!

echo "----> Adding a buildout default.cfg file"
mkdir -p $HOME/.buildout/
cat > $HOME/.buildout/default.cfg << EOF
[buildout]
eggs-directory = $BUILDOUTDIR/buildout-cache/eggs
download-cache = $BUILDOUTDIR/buildout-cache/downloads
extends-cache = $BUILDOUTDIR/buildout-cache/extends
# keep buildout's connection timeout low to speed buildout runs
socket-timeout = 3
EOF

mkdir -p $BUILDOUTDIR/buildout-cache/extends
else

echo "----> Found the buildout/defaults.cfg file, this has been primed before"
echo "----> Skipping the priming step"
fi
