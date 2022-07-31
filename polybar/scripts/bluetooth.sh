#!/bin/bash

# not connected
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
 echo "%{F#ffffff}"
else
 # connected, but no device
 if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
 then
   echo ""
 else
   echo "%{F#2193ff} "
   # get device alias
   # DEVICE=`echo info | bluetoothctl | grep 'Alias:' | awk -F:  '{ print $2 }'`
   # if [[ -z "${DEVICE// }" ]];
   # then
   #   echo "%{F#2193ff} "
   # else
   #   echo "%{F#2193ff} $DEVICE "
   # fi
 fi
fi
