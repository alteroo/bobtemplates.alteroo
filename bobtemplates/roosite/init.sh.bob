#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

source utils.sh
source spinner.sh
SPINNER_SYMBOLS="ASCII_PLUS"

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
    echo "looks like we're on a Mac"
    platform="OSX"
fi
if [[ $platform = 'OSX' ]]; then
    bash homebrew_install.sh
else
    bash deps.sh
    bash memprep.sh
fi
e_header "Initializing for gitlab"
bash gitlab-init.sh
clear
e_header "Priming the machine for Plone now"
bash prime.sh
clear
e_header "Running git init"
bash git-init.sh
clear
e_header "Installing site for development now"
bash install.sh
