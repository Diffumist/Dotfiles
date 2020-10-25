
find /etc -regextype posix-extended -regex ".+\.pac(new|save)" 2> /dev/null
sudo DIFFPROG=kompare pacdiff
