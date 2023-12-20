#!/bin/bash
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
clear
echo -n >/tmp/other.txt
data=($(cat /etc/xray/config.json | grep '^#ss#' | cut -d ' ' -f 2 | sort | uniq))
echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
echo -e "\e[42m         Shadowsocks User Login Account   \E[0m"
echo -e "\033[1;93m─────────────────────────────────────────\033[0m"

for akun in "${data[@]}"; do
    if [[ -z "$akun" ]]; then
        akun="tidakada"
    fi

    echo -n >/tmp/ipshadowsocks.txt
    data2=($(cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq))
    for ip in "${data2[@]}"; do

        jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
        if [[ "$jum" = "$ip" ]]; then
            echo "$jum" >>/tmp/ipshadowsocks.txt
        else
            echo "$ip" >>/tmp/other.txt
        fi
        jum2=$(cat /tmp/ipshadowsocks.txt)
        sed -i "/$jum2/d" /tmp/other.txt >/dev/null 2>&1
    done

    jum=$(cat /tmp/ipshadowsocks.txt)
    if [[ -z "$jum" ]]; then
        echo >/dev/null
    else
        jum2=$(cat /tmp/ipshadowsocks.txt | nl)
        echo "user : $akun"
        echo "$jum2"
        echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
    fi
    rm -rf /tmp/ipshadowsocks.txt
done

rm -rf /tmp/other.txt
echo ""
echo -e "${CYAN}╒════════════════════════════════════════╕${NC}"
echo -e "${BIWhite}          ⇱ SCRIPT BY CLOUDVPN ⇲         ${NC}"
echo -e "${CYAN}╘════════════════════════════════════════╛${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"

menu-ssws
