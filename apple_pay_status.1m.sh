#!/bin/bash
# <bitbar.title>Check Apple Pay DE Status</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Nils Winkler</bitbar.author>
# <bitbar.author.github>nwinkler</bitbar.author.github>
# <bitbar.desc>Displays the status for Apple Pay in Germany (or other countries)</bitbar.desc>
# <bitbar.image>https://github.com/nwinkler/Apple-Pay-Status-BitBar-Plugin/raw/master/Apple%20Pay%20Status%20BitBar.png</bitbar.image>
# <bitbar.dependencies>jq,curl</bitbar.dependencies>
# <bitbar.abouturl>https://github.com/nwinkler/Apple-Pay-Status-BitBar-Plugin</bitbar.abouturl>
#
# Displays the availability status of Apple Pay in Germany
# Runs 1 REST call
#
# Inspired by: https://www.itopnews.de/2018/11/i-mal-1-verfuegbarkeit-von-apple-pay-in-deutschland-bestimmen-und-in-homekit-anzeigen/
#

# CONFIGURATION

JQ_PATH="/usr/local/bin/jq"
REGION="DE"

# END CONFIGURATION

input=$(curl -s "https://smp-device-content.apple.com/static/region/v2/config.json")

# The -e flag sets jq's exit code to 1 if the output was empty
# This is easier than using grep to parse jq's output
echo "$input" | "$JQ_PATH" -e ".SupportedRegions.$REGION" &>/dev/null
state=$?

if [ $state -eq 1 ]; then
  isAvailable="👎"
elif [ $state -eq 0 ]; then
  isAvailable="👍"
fi

echo "Pay $REGION: $isAvailable"
