#!/bin/bash

# Get exchange rates that i'm intrested in
#
# by us3r64@gmail.com
#
# Shows current exchange rates information from http://ex.rm-rf.ro

# metadata
# <bitbar.title>exchange</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>us3r64</bitbar.author>
# <bitbar.author.github>us3r64</bitbar.author.github>
# <bitbar.desc>Shows current track information from http://ex.rm-rf.ro</bitbar.desc>
# <bitbar.image>-</bitbar.image>

((COUNT = 4))
while [[ $COUNT -ne 0 ]] ; do
    ping -q -c 1 8.8.8.8 &> /dev/null
    RC=$?
    if [[ $RC -eq 0 ]] ; then
        ((COUNT = 1))
    fi
    ((COUNT = COUNT - 1))
done
if [[ $RC -eq 0 ]] ; then
    STATUS="online"

    curl --get --include "http://ex.rm-rf.ro" -s | grep "ING: C.*EUR :*" | awk -F ":" '{gsub(/^[ \t]+|[ \t]+$/,"",$4);print $4"| color=green"}'
    # curl --get --include "http://ex.rm-rf.ro" -s | grep "BTC:" | awk -F ":" '{gsub(/^[ \t]+|[ \t]+$/,"",$4);print int($4)"| color=green"}'

    echo "---"
    curl --get --include "http://ex.rm-rf.ro" -s | grep "EUR*\|1 euro"

    echo "Refresh | refresh=true"

else
    STATUS="offline"
fi
