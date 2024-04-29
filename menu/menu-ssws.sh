#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/rmbl/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m" 
RED="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
RED="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')" 
WH='\033[1;37m'         
###########- CLOUDVPNKU -##########

function addssws(){
clear
domain=$(cat /etc/xray/domain)

echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e "$RED ${NC} ${RED}             ${WH}• CREATE SSWS USER •              ${NC} $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
read -rp "   Input Username : " -e user
if [ -z $user ]; then
echo -e "$RED ${NC} [Error] Username cannot be empty "
echo -e "$RED└─────────────────────────────────────────────────┘${NC}" 
echo -e "$RED┌────────────────────── ${WH}BY${NC} ${RED}───────────────────────┐${NC}"
echo -e "$RED ${NC}                ${WH}• CLOUDVPNKU •${NC}                 $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu
fi
CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e "$RED ${NC} ${RED}             ${WH}• CREATE SSWS USER •              ${NC} $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e "$RED ${NC} Please choose another name."
echo -e "$RED└─────────────────────────────────────────────────┘${NC}" 
echo -e "$RED┌────────────────────── ${WH}BY${NC} ${RED}───────────────────────┐${NC}"
echo -e "$RED ${NC}                ${WH}• CLOUDVPNKU •${NC}                 $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ssws
		fi
	done

cipher="aes-128-gcm"
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "   Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#ssws$/a\## '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#ssgrpc$/a\## '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
echo $cipher:$uuid > /tmp/log
shadowsocks_base64=$(cat /tmp/log)
echo -n "${shadowsocks_base64}" | base64 > /tmp/log1
shadowsocks_base64e=$(cat /tmp/log1)
shadowsockslink="ss://${shadowsocks_base64e}@$domain:443?plugin=xray-plugin;mux=0;path=/ss-ws;host=$domain;443#${user}"
shadowsockslink1="ss://${shadowsocks_base64e}@$domain:443?plugin=xray-plugin;mux=0;serviceName=ss-grpc;host=$domain;443#${user}"
systemctl restart xray
rm -rf /tmp/log
rm -rf /tmp/log1
cat > /home/vps/public_html/ss-ws/ss-$user.txt <<-END
# sodosok ws
{ 
 "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "password": "$uuid",
            "port": 443
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "isi_bug_disini"
        },
        "wsSettings": {
          "headers": {
            "Host": "$domain"
          },
          "path": "/ss-ws"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
 }
 
 # SODOSOK grpc


{
    "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "password": "$uuid",
            "port": 443
          }
        ]
      },
      "streamSettings": {
        "grpcSettings": {
          "multiMode": true,
          "serviceName": "ss-grpc"
        },
        "network": "grpc",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "isi_bug_disini"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
}
END
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1
clear
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e "$RED ${NC} ${RED}             ${WH}• CREATE SSWS USER •              ${NC} $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e "$RED ${NC} ${WH}Remarks     ${RED}: ${WH}${user}" 
echo -e "$RED ${NC} ${WH}Expired On  ${RED}: ${WH}$exp"  
echo -e "$RED ${NC} ${WH}Domain      ${RED}: ${WH}${domain}"  
echo -e "$RED ${NC} ${WH}Port TLS    ${RED}: ${WH} 443"  
echo -e "$RED ${NC} ${WH}Port  GRPC  ${RED}: ${WH} 443" 
echo -e "$RED ${NC} ${WH}Password    ${RED}: ${WH}${uuid}"  
echo -e "$RED ${NC} ${WH}Cipers      ${RED}: ${WH}aes-128-gcm"  
echo -e "$RED ${NC} ${WH}Network     ${RED}: ${WH}ws/grpc"  
echo -e "$RED ${NC} ${WH}Path        ${RED}: ${WH}/ss-ws"  
echo -e "$RED ${NC} ${WH}ServiceName ${RED}: ${WH}ss-grpc"  
echo -e "$RED└─────────────────────────────────────────────────┘${NC}" 
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e "$RED ${NC} ${WH}Link TLS ${RED}: ${NC}"
echo -e "$RED ${NC} ${shadowsockslink}"  
echo -e "$RED ${NC} "
echo -e "$RED ${NC} ${WH}Link GRPC ${RED}: ${NC}"
echo -e "$RED ${NC} ${shadowsockslink1}"  
echo -e "$RED ${NC} "
echo -e "$RED ${NC} Link JSON : http://${domain}:81/ss-ws/ss-$user.txt"  
echo -e "$RED└─────────────────────────────────────────────────┘${NC}" 
echo -e "$RED┌────────────────────── ${WH}BY${NC} ${RED}───────────────────────┐${NC}"
echo -e "$RED ${NC}                ${WH}• CLOUDVPNKU •${NC}                 $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo ""  
read -n 1 -s -r -p "   Press any key to back on menu"
m-ssws
}

function renewssws(){
clear
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e "$RED ${NC} ${RED}              ${WH}• RENEW SSWS USER •              ${NC} $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
NUMBER_OF_CLIENTS=$(grep -c -E "^## " "/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
echo -e "$RED ${NC}  • You have no existing clients!"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}" 
echo -e "$RED┌────────────────────── ${WH}BY${NC} ${RED}───────────────────────┐${NC}"
echo -e "$RED ${NC}                ${WH}• CLOUDVPNKU •${NC}                 $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ssws
fi
clear
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e "$RED ${NC} ${RED}              ${WH}• RENEW SSWS USER •              ${NC} $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
grep -E "^## " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl
echo -e "$RED ${NC}"
echo -e "$RED ${NC}  ${RED}• ${WH}[${RED}NOTE${WH}] Press any key to back on menu"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}" 
echo -e "$RED┌────────────────────── ${WH}BY${NC} ${RED}───────────────────────┐${NC}"
echo -e "$RED ${NC}                ${WH}• CLOUDVPNKU •${NC}                 $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo -e "$RED───────────────────────────────────────────────────${NC}"
read -rp "   Input Username : " user
if [ -z $user ]; then
m-ssws
else
read -p "   Expired (days): " masaaktif
if [ -z $masaaktif ]; then
masaaktif="1"
fi
exp=$(grep -E "^## $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "/## $user/c\## $user $exp4" /etc/xray/config.json
systemctl restart xray > /dev/null 2>&1
clear
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e "$RED ${NC} ${RED}              ${WH}• RENEW SSWS USER •              ${NC} $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e "$RED ${NC}   ${WH}[${RED}INFO${WH}]${NC}  ${WH}$user Account Renewed Successfully"
echo -e "$RED ${NC}   "
echo -e "$RED ${NC}   ${WH}Client Name ${RED}: ${WH}$user"
echo -e "$RED ${NC}   ${WH}Days Added  ${RED}: ${WH}$masaaktif Days"
echo -e "$RED ${NC}   ${WH}Expired On  ${RED}: ${WH}$exp4"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}" 
echo -e "$RED┌────────────────────── ${WH}BY${NC} ${RED}───────────────────────┐${NC}"
echo -e "$RED ${NC}                ${WH}• CLOUDVPNKU •${NC}                 $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ssws
fi
}

function delssws(){
    clear
NUMBER_OF_CLIENTS=$(grep -c -E "^## " "/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e "$RED ${NC} ${RED}           ${WH}• DELETE TROJAN USER •              ${NC} $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e "$RED ${NC}  ${RED}• ${WH}You Dont have any existing clients!${NC}"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}" 
echo -e "$RED┌────────────────────── ${WH}BY${NC} ${RED}───────────────────────┐${NC}"
echo -e "$RED ${NC}                ${WH}• CLOUDVPNKU •${NC}                 $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ssws
fi
clear
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e "$RED ${NC} ${RED}           ${WH}• DELETE TROJAN USER •              ${NC} $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
grep -E "^## " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl
echo -e "$RED ${NC}"
echo -e "$RED ${NC}  ${RED}• ${WH}[${RED}NOTE${WH}]${NC} ${WH}Press any key to back on menu${NC}"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo -e "$RED───────────────────────────────────────────────────${NC}"
read -rp "   Input Username : " user
if [ -z $user ]; then
m-ssws
else
exp=$(grep -wE "^## $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
sed -i "/^## $user $exp/,/^},{/d" /etc/xray/config.json
systemctl restart xray > /dev/null 2>&1
rm /home/vps/public_html/ss-ws/ss-$user.txt
clear
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e "$RED ${NC} ${RED}           ${WH}• DELETE TROJAN USER •              ${NC} $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e "$RED ${NC}   ${RED}• ${WH}Accound Delete Successfully"
echo -e "$RED ${NC}"
echo -e "$RED ${NC}   ${RED}• ${WH}Client Name ${RED}: ${WH}$user${NC}"
echo -e "$RED ${NC}   ${RED}• ${WH}Expired On  ${RED}: ${WH}$exp${NC}"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}" 
echo -e "$RED┌────────────────────── ${WH}BY${NC} ${RED}───────────────────────┐${NC}"
echo -e "$RED ${NC}                ${WH}• CLOUDVPNKU •${NC}                 $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ssws
fi
}

function cekssws(){
clear
echo -n > /tmp/other.txt
data=( `cat /etc/xray/config.json | grep '^##' | cut -d ' ' -f 2 | sort | uniq`);
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e "$RED ${NC} ${RED}             ${WH}• SSWS USER ONLINE •              ${NC} $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"

for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi

echo -n > /tmp/ipssws.txt
data2=( `cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq`);
for ip in "${data2[@]}"
do

jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipssws.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipssws.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done

jum=$(cat /tmp/ipssws.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipssws.txt | nl)
echo -e "$RED ${NC}   user : $akun";
echo -e "$RED ${NC}   $jum2";
fi
rm -rf /tmp/ipssws.txt
done

rm -rf /tmp/other.txt
echo -e "$RED└─────────────────────────────────────────────────┘${NC}" 
echo -e "$RED┌────────────────────── ${WH}BY${NC} ${RED}───────────────────────┐${NC}"
echo -e "$RED ${NC}                ${WH}• CLOUDVPNKU •${NC}                 $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ssws
}

clear
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e "$RED ${NC} ${RED}              ${WH}• SSWS PANEL MENU •              ${NC} $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo -e " $RED┌───────────────────────────────────────────────┐${NC}"
echo -e " $RED $NC   ${WH}[${RED}01${WH}]${NC} ${RED}• ${WH}ADD SSWS${NC}      ${WH}[${RED}03${WH}]${NC} ${RED}• ${WH}DELETE SSWS${NC}     $RED $NC"
echo -e " $RED $NC   ${WH}[${RED}02${WH}]${NC} ${RED}• ${WH}RENEW SSWS${NC}    ${WH}[${RED}04${WH}]${NC} ${RED}• ${WH}USER ONLINE${NC}     $RED $NC"
echo -e " $RED $NC                                              ${NC} $RED $NC"
echo -e " $RED $NC   ${WH}[${RED}00${WH}]${NC} ${RED}• ${WH}GO BACK${NC}                              $RED $NC"
echo -e " $RED└───────────────────────────────────────────────┘${NC}"
echo -e "$RED┌────────────────────── ${WH}BY${NC} ${RED}───────────────────────┐${NC}"
echo -e "$RED ${NC}                ${WH}• CLOUDVPNKU •${NC}                 $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${RED}: ${WH}"; read opt
case $opt in
01 | 1) clear ; addssws ;;
02 | 2) clear ; renewssws ;;
03 | 3) clear ; delssws ;;
04 | 4) clear ; cekssws ;;
00 | 0) clear ; menu ;;
*) clear ; m-ssws ;;
esac
