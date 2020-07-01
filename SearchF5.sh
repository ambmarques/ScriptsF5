#!/bin/bash
echo "##$(tput setaf 1)$(tput setab 7)F5 - LB - Description$(tput sgr 0)##"
output=$(curl -sku 'user:password' -X POST -H "Content-type: application/json" -d "{\"command\":\"run\", \"utilCmdArgs\": \"-c 'tmsh list ltm virtual one-line | grep $1'\"}" "https://URL/mgmt/tm/util/bash" | jq -r ".commandResult";)
echo "$output"
echo "$(tput setaf 1)$(tput setab 7)##Pool##$(tput sgr 0)"
var1=$(grep -oP '(?<=pool ).*?(?= profiles)' <<< "$output";)
echo "$var1"
output2=$(curl -sku 'user:password' -X POST -H "Content-type: application/json" -d "{\"command\":\"run\", \"utilCmdArgs\": \"-c 'tmsh list ltm pool one-line | grep '$var1' '\"}" "https://URL/mgmt/tm/util/bash" | jq -r ".commandResult";)
echo "$(tput setaf 1)$(tput setab 7)##Members##$(tput sgr 0)"
echo "$output2"
echo "$output2"
