#!/bin/bash

# Get current ING exchange
#
# by us3r64@gmail.com
#
# Shows current track information from http://ingexchange-nibbler.rhcloud.com

# metadata
# <bitbar.title>ING exchange</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>us3r64</bitbar.author>
# <bitbar.author.github>us3r64</bitbar.author.github>
# <bitbar.desc>Shows current track information from http://ingexchange-nibbler.rhcloud.com</bitbar.desc>
# <bitbar.image>-</bitbar.image>

curl --get --include "http://ingexchange-nibbler.rhcloud.com" -s | grep "ING: C.*USD:*" | awk -F ":" '{gsub(/^[ \t]+|[ \t]+$/,"",$4);print "USD:"$4"| color=green"}'

echo "---"
curl --get --include "http://ingexchange-nibbler.rhcloud.com" -s | grep "USD*"

echo "Refresh | refresh=true"