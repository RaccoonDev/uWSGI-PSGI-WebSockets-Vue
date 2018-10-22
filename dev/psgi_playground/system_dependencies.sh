#!/bin/bash

sudo apt-get update
sudo apt-get install python perl-dev libperl-dev nodejs libssl-dev

# Download uwsgi sources, compile couple binaries and out them
# into $HOME/bin folder. Make sure that the folder is in PATH
mkdir ~/downloads;
cd ~/downloads && wget https://projects.unbit.it/downloads/uwsgi-2.0.17.1.tar.gz
tar -xzvf uwsgi-2.0.17.1.tar.gz
cd uwsgi-2.0.17.1

mkdir ~/bin
UWSGI_PROFILE=psgi make
cp ./uwsgi ~/bin/uwsgi_psgi

UWSGI_PROFILE="coroae" UWSGI_PROFILE_OVERRIDE="ssl=true" make
cp ./uwsgi ~/bin/uwsgi_psgi_coroae

