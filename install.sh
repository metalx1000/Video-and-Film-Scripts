#!/bin/bash
#Script by Kris Occhipinti
#http://filmsbykris.com
#GPLv3 - http://www.gnu.org/licenses/gpl-3.0.txt
#Source code https://github.com/metalx1000/Video-and-Film-Scripts

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root or sudo" 1>&2
   exit 1
fi

apt-get install youtube-dl melt mplayer

dir="/usr/local/bin"
cd $dir

#get MELT scripts
base_url="https://raw.githubusercontent.com/metalx1000/Video-and-Film-Scripts/master/melt/"
array=( trim fade get_film combine)
for i in "${array[@]}"
do
    echo "Downloading $i"
    wget "${base_url}$i" -O $i
    chmod +x $i
done
