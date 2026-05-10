#!/bin/bash
echo -e "\e[1;33m[*] INITIATING GLOBAL TUNNEL...\e[0m"
ssh -R 80:localhost:8080 sh@localhost.run > tunnel.log 2>&1 &
sleep 5
LINK=$(grep -o 'https://[a-zA-Z0-9.-]*\.lhr\.life' tunnel.log | head -n 1)
if [ -z "$LINK" ]; then
    echo -e "\e[1;31m[!] FAILED TO GET LINK. CHECK YOUR SSH KEY.\e[0m"
else
    echo -e "\e[1;32m[✔] ONLINE LINK: \e[1;37m$LINK\e[0m"
    echo "$LINK" > current_link.txt
fi
