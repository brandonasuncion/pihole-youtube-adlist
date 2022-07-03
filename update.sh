#!/bin/sh

# based off: https://gist.github.com/ErikFontanel/4ee1ab393b119690a293ba558976b113

FILE=blacklist.txt

curl 'https://api.hackertarget.com/hostsearch/?q=googlevideo.com' \
    | awk -F, 'NR>1{print $1}' \
    | grep -vE "redirector|manifest" > $FILE

cat $FILE | sed -r "s/(^r[[:digit:]]+)(\.)(sn)/\1---\3-/" >> $FILE