#!/bin/bash
# minmem is the minimum we'll work with
# basemem is the minimum amount that needs no swapfile
minmem='500000'
basemem='1000000'
memtotal=$(cat /proc/meminfo |grep MemTotal |cut -c18- |cut -d' ' -f1)
echo "found $memtotal kB of memory"
if [ $memtotal -gt $minmem ];
then
   echo "there's enough memory"
else
   echo "not enough memory, you need at least 512MB to run Plone"
   exit 1
fi
if [ $memtotal -gt $basemem ];
then
   echo "we're good no need for a swap file"
else
   echo "we're going to need a swap file"
   echo "attempting to add one now"

  if [ -z ${C9_USER+x} ]; then

	sudo dd if=/dev/zero of=/swapfile bs=1024 count=500000
	sudo mkswap /swapfile
	sudo chmod 600 /swapfile
	sudo swapon /swapfile

  else
        echo "Oh, oh, this is C9. We can't create swap files on C9, sorry"
  fi
fi
