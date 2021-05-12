#!/bin/sh

if [ $USER == "root" -o $UID -eq 0 ];then
    find /etc -regextype posix-extended -regex ".+\.pac(new|save)" 2> /dev/null
    DIFFPROG=kompare pacdiff
else
    echo "Insufficient Permissions"
    exit
fi