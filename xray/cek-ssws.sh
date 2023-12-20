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
function con() {
    local -i bytes=$1;
    if [[ $bytes -lt 1024 ]]; then
        echo "${bytes}B"
    elif [[ $bytes -lt 1048576 ]]; then
        echo "$(( (bytes + 1023)/1024 ))KB"
    elif [[ $bytes -lt 1073741824 ]]; then
        echo "$(( (bytes + 1048575)/1048576 ))MB"
    else
        echo "$(( (bytes + 1073741823)/1073741824 ))GB"
    fi
}
echo -n > /tmp/other.txt
data=( `cat /etc/xray/config.json | grep '^#ss#' | cut -d ' ' -f 2`);
echo "----------------------------------------";
echo "---------=[ shadowsocks User Login ]=---------";
echo "----------------------------------------";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="There isn't any"
fi
echo -n > /tmp/ipshadowsocks.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipshadowsocks.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipshadowsocks.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipshadowsocks.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipshadowsocks.txt | nl)
echo "user : $akun";
echo "$jum2";
echo "----------------------------------------"
fi
rm -rf /tmp/ipshadowsocks.txt
done
oth=$(cat /tmp/other.txt | sort | uniq | nl)
echo "other";
echo "$oth";
echo "----------------------------------------"
rm -rf /tmp/other.txt
echo ""
echo -e "${CYAN}╒════════════════════════════════════════╕${NC}"
echo -e "${BIWhite}          ⇱ SCRIPT BY CLOUDVPN ⇲         ${NC}"
echo -e "${CYAN}╘════════════════════════════════════════╛${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"

menu-ssws
