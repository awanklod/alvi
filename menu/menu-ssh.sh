#!/bin/bash
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
colornow=$(cat /etc/rmbl/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
RED="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
RED="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
ipsaya=$(wget -qO- ifconfig.me)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/awanklod/izin_alvi/main/izin"
checking_sc() {
useexp=$(curl -sS $data_ip | grep $ipsaya | awk '{print $3}')
if [[ $date_list < $useexp ]]; then
echo -ne
else
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}         ${WH}• AUTOSCRIPT PREMIUM •                ${NC} $RED│ $NC"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│            ${RED}PERMISSION DENIED !${NC}                  │"
echo -e "$RED│   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}                             │"
echo -e "$RED│     \033[0;33mBuy access permissions for scripts${NC}          │"
echo -e "$RED│             \033[0;33mContact Your Admin ${NC}                 │"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
exit
fi
}
checking_sc
#ISP=$(cat /etc/xray/isp)
#CITY=$(cat /etc/xray/city)
author=$(cat /etc/profil)
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
domain=`cat /etc/xray/domain`
CHATID2=$(cat /etc/perlogin/id)
KEY2=$(cat /etc/perlogin/token)
URL2="https://api.telegram.org/bot$KEY2/sendMessage"
cd
if [ ! -e /etc/xray/sshx/akun ]; then
mkdir -p /etc/xray/sshx/akun
fi
function usernew(){
clear
domen=`cat /etc/xray/domain`
#sldomain=`cat /etc/xray/dns`
#slkey=`cat /etc/slowdns/server.pub`
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
#ISP=$(cat /etc/xray/isp)
#CITY=$(cat /etc/xray/city)
author=$(cat /etc/profil)
clear
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}              ${WH}• SSH PANEL MENU •               ${NC} $RED│ $NC"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
until [[ $Login =~ ^[a-zA-Z0-9_.-]+$ && ${CLIENT_EXISTS} == '0' ]]; do
read -p "Username : " Login
CLIENT_EXISTS=$(grep -w $Login /etc/xray/ssh | wc -l)
if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}              ${WH}• SSH PANEL MENU •               ${NC} $RED│ $NC"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│                                                 │"
echo -e "$RED│${WH} Nama Duplikat Silahkan Buat Nama Lain.          $RED│"
echo -e "$RED│                                                 │"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
read -n 1 -s -r -p "Press any key to back"
usernew
fi
done
read -p "Password : " Pass
until [[ $masaaktif =~ ^[0-9]+$ ]]; do
read -p "Expired (hari): " masaaktif
done
until [[ $iplim =~ ^[0-9]+$ ]]; do
read -p "Limit User (IP): " iplim
done
if [ ! -e /etc/xray/sshx ]; then
mkdir -p /etc/xray/sshx
fi
if [ -z ${iplim} ]; then
iplim="0"
fi
echo "${iplim}" >/etc/xray/sshx/${Login}IP
IP=$(curl -sS ifconfig.me);
if [[ -e /etc/cloudfront ]]; then
cloudfront=$(cat /etc/cloudfront)
else
cloudfront="-"
fi
sleep 1
clear
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "### $Login $expi $Pass" >> /etc/xray/ssh
cat > /home/vps/public_html/ssh-$Login.txt <<-END
_______________________________
Format SSH OVPN Account
_______________________________
Username         : $Login
Password         : $Pass
Expired          : $exp
_______________________________
Host             : $domen
#ISP              : $ISP
#CITY             : $CITY
Login Limit      : ${iplim} IP
Port OpenSSH     : 22
Port Dropbear    : 143, 109
Port SSH WS      : 80, 7788, 8181, 8282
Port SSH SSL WS  : 443
Port SSL/TLS     : 777, 222
Port OVPN WS SSL : 2086
Port OVPN SSL    : 990
Port OVPN TCP    : 1194
Port OVPN UDP    : 2200,
BadVPN UDP       : 7100, 7300, 7300
_______________________________
#Host Slowdns    : $sldomain
#Port Slowdns     : 80, 443, 53
#Pub Key          : $slkey
_______________________________
SSH UDP VIRAL : $domen:1-65535@$Login:$Pass
_______________________________
HTTP COSTUM : $domen:80@$Login:$Pass
_______________________________
Payload WS/WSS   :
GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: ws[crlf][crlf]
_______________________________
OpenVPN SSL      : http://$domen:89/ssl.ovpn
OpenVPN TCP      : http://$domen:89/tcp.ovpn
OpenVPN UDP      : http://$domen:89/udp.ovpn
_______________________________
END
if [[ -e /etc/cloudfront ]]; then
TEXT="
◇━━━━━━━━━━━━━━━━━◇
SSH Premium Account
◇━━━━━━━━━━━━━━━━━◇
Username        :  <code>$Login</code>
Password        :  <code>$Pass</code>
Expired On       :  $exp
◇━━━━━━━━━━━━━━━━━◇
#ISP              :  $ISP
#CITY             :  $CITY
Host             :  <code>$domen</code>
Login Limit      :  ${iplim} IP
Port OpenSSH    :  22
Port Dropbear    :  109, 143
Port SSH WS     :  80, 7788, 8181, 8282
Port SSH SSL WS :  443
Port SSL/TLS     :  222,777
Port OVPN WS SSL :  2086
Port OVPN SSL    :  990
Port OVPN TCP    :  1194
Port OVPN UDP    :  2200
Proxy Squid        :  3128
BadVPN UDP       :  7100, 7300, 7300
◇━━━━━━━━━━━━━━━━━◇
SSH UDP VIRAL : <code>$domen:1-65535@$Login:$Pass</code>
◇━━━━━━━━━━━━━━━━━◇
HTTP COSTUM WS : <code>$domen:80@$Login:$Pass</code>
◇━━━━━━━━━━━━━━━━━◇
#Host Slowdns    :  <code>$sldomain</code>
#Port Slowdns     :  80, 443, 53
#Pub Key          :  <code> $slkey</code>
◇━━━━━━━━━━━━━━━━━◇
Payload WS/WSS   :
<code>GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: ws[crlf][crlf]</code>
◇━━━━━━━━━━━━━━━━━◇
OpenVPN SSL      :  http://$domen:89/ssl.ovpn
OpenVPN TCP      :  http://$domen:89/tcp.ovpn
OpenVPN UDP      :  http://$domen:89/udp.ovpn
◇━━━━━━━━━━━━━━━━━◇
Save Link Account: http://$domen:89/ssh-$Login.txt
◇━━━━━━━━━━━━━━━━━◇
$author
◇━━━━━━━━━━━━━━━━━◇
"
else
TEXT="
◇━━━━━━━━━━━━━━━━━◇
SSH Premium Account
◇━━━━━━━━━━━━━━━━━◇
Username        :  <code>$Login</code>
Password        :  <code>$Pass</code>
Expired On       :  $exp
◇━━━━━━━━━━━━━━━━━◇
#ISP              :  $ISP
#CITY             :  $CITY
Host             :  <code>$domen</code>
Login Limit      :  ${iplim} IP
Port OpenSSH    :  22
Port Dropbear    :  109, 143
Port SSH WS     :  80, 7788, 8181, 8282
Port SSH SSL WS :  443
Port SSL/TLS     :  777,222
Port OVPN WS SSL :  2086
Port OVPN SSL    :  990
Port OVPN TCP    :  1194
Port OVPN UDP    :  2200
Proxy Squid        :  3128
BadVPN UDP       :  7100, 7300, 7300
◇━━━━━━━━━━━━━━━━━◇
SSH UDP VIRAL : <code>$domen:1-65535@$Login:$Pass</code>
◇━━━━━━━━━━━━━━━━━◇
HTTP COSTUM WS : <code>$domen:80@$Login:$Pass</code>
◇━━━━━━━━━━━━━━━━━◇
#Host Slowdns    :  <code>$sldomain</code>
#Port Slowdns     :  80, 443, 53
#Pub Key          :  <code> $slkey</code>
◇━━━━━━━━━━━━━━━━━◇
Payload WS/WSS   :
<code>GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: ws[crlf][crlf]</code>
◇━━━━━━━━━━━━━━━━━◇
OpenVPN SSL      :  http://$domen:89/ssl.ovpn
OpenVPN TCP      :  http://$domen:89/tcp.ovpn
OpenVPN UDP      :  http://$domen:89/udp.ovpn
◇━━━━━━━━━━━━━━━━━◇
Save Link Account: http://$domen:89/ssh-$Login.txt
◇━━━━━━━━━━━━━━━━━◇
$author
◇━━━━━━━━━━━━━━━━━◇
"
fi
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
cd
if [ ! -e /etc/tele ]; then
echo -ne
else
echo "$TEXT" > /etc/notiftele
bash /etc/tele
fi
user2=$(echo "$Login" | cut -c 1-3)
TIME2=$(date +'%Y-%m-%d %H:%M:%S')
TEXT2="
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<b>   PEMBELIAN SSH SUCCES </b>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<b>DOMAIN  :</b> <code>${domain} </code>
<b>CITY    :</b> <code>$CITY </code>
<b>DATE    :</b> <code>${TIME2} WIB </code>
<b>DETAIL  :</b> <code>Trx SSH </code>
<b>USER    :</b> <code>${user2}xxx </code>
<b>IP      :</b> <code>${iplim} IP </code>
<b>DURASI  :</b> <code>$masaaktif Hari </code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<i>Notif Pembelian Akun Ssh..</i>"
curl -s --max-time $TIMES -d "chat_id=$CHATID2&disable_web_page_preview=1&text=$TEXT2&parse_mode=html" $URL2 >/dev/null
clear
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ${NC} ${WH}• SSH Premium Account  • " | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Username   ${RED}: ${WH}$Login"  | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Password   ${RED}: ${WH}$Pass" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Expired On ${RED}: ${WH}$exp"  | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
#echo -e "$RED $NC  ${WH}ISP        ${RED}: ${WH}$ISP" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
#echo -e "$RED $NC  ${WH}City       ${RED}: ${WH}$CITY" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Host       ${RED}: ${WH}$domen" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Login Limit${RED}: ${WH}${iplim} IP" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}OpenSSH    ${RED}: ${WH}22" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Dropbear   ${RED}: ${WH}109, 143" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}SSH-WS     ${RED}: ${WH}80, 7788, 8181, 8282" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}SSH-SSL-WS ${RED}: ${WH}443" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}SSL/TLS    ${RED}: ${WH}222,777" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Ovpn Ws    ${RED}: ${WH}2086" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Port TCP   ${RED}: ${WH}1194" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Port UDP   ${RED}: ${WH}2200,1-65535" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Port SSL   ${RED}: ${WH}990" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}OVPN TCP   ${RED}: ${WH}http://$domen:89/tcp.ovpn" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}OVPN UDP   ${RED}: ${WH}http://$domen:89/udp.ovpn" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}OVPN SSL   ${RED}: ${WH}http://$domen:89/ssl.ovpn" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}UDPGW      ${RED}: ${WH}7100-7300" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
#echo -e "$RED $NC  ${WH}PORT SLWDNS${RED}: ${WH}80,443,53" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
#echo -e "$RED $NC  ${WH}NAMESERVER ${RED}: ${WH}$sldomain" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
#echo -e "$RED $NC  ${WH}PUB KEY    ${RED}: ${WH}$slkey" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}UDP VIRAL${RED}: ${WH}$domen:1-65535@$Login:$Pass" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}HTTP COSTUM${RED}: ${WH}$domen:80@$Login:$Pass" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ${NC}  ${WH}Payload WS/WSS${RED}: ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED${NC}${WH}GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: ws[crlf][crlf]${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ${NC}  ${WH}Save Link Acount    : " | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ${NC}  ${WH}http://$domen:89/ssh-$Login.txt${NC}$RED $NC" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ${NC}    ${WH}• $author •${NC}                 $RED $NC" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo "" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function trial(){
clear
domen=`cat /etc/xray/domain`
sldomain=`cat /etc/xray/dns`
slkey=`cat /etc/slowdns/server.pub`
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
#ISP=$(cat /etc/xray/isp)
#CITY=$(cat /etc/xray/city)
author=$(cat /etc/profil)
clear
IP=$(curl -sS ifconfig.me)
cd
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}           ${WH}• TRIAL SSH Account •               ${NC} $RED│ $NC"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
echo -e ""
until [[ $timer =~ ^[0-9]+$ ]]; do
read -p "Expired (Minutes): " timer
done
Login=Trial-`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari=0
Pass=1
iplim=1
if [ ! -e /etc/xray/sshx ]; then
mkdir -p /etc/xray/sshx
fi
if [ -z ${iplim} ]; then
iplim="0"
fi
if [[ -e /etc/cloudfront ]]; then
cloudfront=$(cat /etc/cloudfront)
else
cloudfront="Kosong"
fi
echo "$iplim" > /etc/xray/sshx/${Login}IP
expi=`date -d "$hari days" +"%Y-%m-%d"`
useradd -e `date -d "$hari days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "### $Login $expi $Pass" >> /etc/xray/ssh
tmux new-session -d -s $Login "trial ssh $Login $expi $Pass ${timer}"
cat > /home/vps/public_html/ssh-$Login.txt <<-END
_______________________________
Format SSH OVPN Account
_______________________________
Username         : $Login
Password         : $Pass
Expired          : $timer Minutes
_______________________________
Host             : $domen
#ISP              : $ISP
#CITY             : $CITY
Login Limit      : ${iplim} IP
Port OpenSSH     : 22
Port Dropbear    : 143, 109
Port SSH WS      : 80, 7788, 8181, 8282
Port SSH SSL WS  : 443
Port SSL/TLS     : 222, 777
Port OVPN WS SSL : 2086
Port OVPN SSL    : 990
Port OVPN TCP    : 1194
Port OVPN UDP    : 2200,
BadVPN UDP       : 7100, 7300, 7300
_______________________________
#Host Slowdns    : $sldomain
#Port Slowdns     : 80, 443, 53
#Pub Key          : $slkey
_______________________________
SSH UDP VIRAL : $domen:1-65535@$Login:$Pass
_______________________________
HTTP COSTUM : $domen:80@$Login:$Pass
_______________________________
Payload WS/WSS   :
GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: ws[crlf][crlf]
_______________________________
OpenVPN SSL      : http://$domen:89/ssl.ovpn
OpenVPN TCP      : http://$domen:89/tcp.ovpn
OpenVPN UDP      : http://$domen:89/udp.ovpn
_______________________________
END
if [[ -e /etc/cloudfront ]]; then
TEXT="
◇━━━━━━━━━━━━━━━━━◇
Trial SSH Premium Account
◇━━━━━━━━━━━━━━━━━◇
Username        :  <code>$Login</code>
Password        :  <code>$Pass</code>
Expired On       :  $timer Minutes
◇━━━━━━━━━━━━━━━━━◇
#ISP              :  $ISP
#CITY             :  $CITY
Host             :  <code>$domen</code>
Login Limit      :  ${iplim} IP
Port OpenSSH    :  22
Port Dropbear    :  109, 143
Port SSH WS     :  80, 7788, 8181, 8282
Port SSH SSL WS :  443
Port SSL/TLS     :  222,777
Port OVPN WS SSL :  2086
Port OVPN SSL    :  990
Port OVPN TCP    :  1194
Port OVPN UDP    :  2200
Proxy Squid        :  3128
BadVPN UDP       :  7100, 7300, 7300
◇━━━━━━━━━━━━━━━━━◇
SSH UDP VIRAL : <code>$domen:1-65535@$Login:$Pass</code>
◇━━━━━━━━━━━━━━━━━◇
HTTP COSTUM WS : <code>$domen:80@$Login:$Pass</code>
◇━━━━━━━━━━━━━━━━━◇
#Host Slowdns    :  <code>$sldomain</code>
#Port Slowdns     :  80, 443, 53
#Pub Key          :  <code> $slkey</code>
◇━━━━━━━━━━━━━━━━━◇
Payload WS/WSS   :
<code>GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: ws[crlf][crlf]</code>
◇━━━━━━━━━━━━━━━━━◇
OpenVPN SSL      :  http://$domen:89/ssl.ovpn
OpenVPN TCP      :  http://$domen:89/tcp.ovpn
OpenVPN UDP      :  http://$domen:89/udp.ovpn
◇━━━━━━━━━━━━━━━━━◇
Save Link Account: http://$domen:89/ssh-$Login.txt
◇━━━━━━━━━━━━━━━━━◇
$author
◇━━━━━━━━━━━━━━━━━◇
"
else
TEXT="
◇━━━━━━━━━━━━━━━━━◇
Trial SSH Premium Account
◇━━━━━━━━━━━━━━━━━◇
Username        :  <code>$Login</code>
Password        :  <code>$Pass</code>
Expired On       :  $timer Minutes
◇━━━━━━━━━━━━━━━━━◇
#ISP              :  $ISP
#CITY             :  $CITY
Host             :  <code>$domen</code>
Login Limit      :  ${iplim} IP
Port OpenSSH    :  22
Port Dropbear    :  109, 143
Port SSH WS     :  80, 7788, 8181, 8282
Port SSH SSL WS :  443
Port SSL/TLS     :  222,777
Port OVPN WS SSL :  2086
Port OVPN SSL    :  990
Port OVPN TCP    :  1194
Port OVPN UDP    :  2200
Proxy Squid        :  3128
BadVPN UDP       :  7100, 7300, 7300
◇━━━━━━━━━━━━━━━━━◇
SSH UDP VIRAL : <code>$domen:1-65535@$Login:$Pass</code>
◇━━━━━━━━━━━━━━━━━◇
HTTP COSTUM WS : <code>$domen:80@$Login:$Pass</code>
◇━━━━━━━━━━━━━━━━━◇
#Host Slowdns    :  <code>$sldomain</code>
#Port Slowdns     :  80, 443, 53
#Pub Key          :  <code> $slkey</code>
◇━━━━━━━━━━━━━━━━━◇
Payload WS/WSS   :
<code>GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: ws[crlf][crlf]</code>
◇━━━━━━━━━━━━━━━━━◇
OpenVPN SSL      :  http://$domen:89/ssl.ovpn
OpenVPN TCP      :  http://$domen:89/tcp.ovpn
OpenVPN UDP      :  http://$domen:89/udp.ovpn
◇━━━━━━━━━━━━━━━━━◇
Save Link Account: http://$domen:89/ssh-$Login.txt
◇━━━━━━━━━━━━━━━━━◇
$author
◇━━━━━━━━━━━━━━━━━◇
"
fi
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
cd
if [ ! -e /etc/tele ]; then
echo -ne
else
echo "$TEXT" > /etc/notiftele
bash /etc/tele
fi
cat> /etc/cron.d/trialssh${Login} << EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/$timer * * * * root /usr/bin/trial ssh $Login $Pass $expi
EOF
clear
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ${NC} ${WH}• Trial SSH Premium Account • " | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Username   ${RED}: ${WH}$Login"  | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Password   ${RED}: ${WH}$Pass" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Expired On ${RED}: ${WH}$timer Minutes"  | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
#echo -e "$RED $NC  ${WH}ISP        ${RED}: ${WH}$ISP" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
#echo -e "$RED $NC  ${WH}City       ${RED}: ${WH}$CITY" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Host       ${RED}: ${WH}$domen" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Login Limit${RED}: ${WH}${iplim} IP" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}OpenSSH    ${RED}: ${WH}22" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Dropbear   ${RED}: ${WH}109, 143" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}SSH-WS     ${RED}: ${WH}80, 7788, 8181, 8282" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}SSH-SSL-WS ${RED}: ${WH}443" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}SSL/TLS    ${RED}: ${WH}222,777" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Ovpn Ws    ${RED}: ${WH}2086" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Port TCP   ${RED}: ${WH}1194" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Port UDP   ${RED}: ${WH}2200,1-65535" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}Port SSL   ${RED}: ${WH}990" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}OVPN TCP   ${RED}: ${WH}http://$domen:89/tcp.ovpn" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}OVPN UDP   ${RED}: ${WH}http://$domen:89/udp.ovpn" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}OVPN SSL   ${RED}: ${WH}http://$domen:89/ssl.ovpn" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}UDPGW      ${RED}: ${WH}7100-7300" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
#echo -e "$RED $NC  ${WH}PORT SLWDNS${RED}: ${WH}80,443,53" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
#echo -e "$RED $NC  ${WH}NAMESERVER ${RED}: ${WH}$sldomain" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
#echo -e "$RED $NC  ${WH}PUB KEY    ${RED}: ${WH}$slkey" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}UDP VIRAL${RED}: ${WH}$domen:1-65535@$Login:$Pass" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED $NC  ${WH}HTTP COSTUM${RED}: ${WH}$domen:80@$Login:$Pass" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ${NC}  ${WH}Payload WS/WSS${RED}: ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED${NC}${WH}GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: ws[crlf][crlf]${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ${NC}  ${WH}Save Link Acount    : " | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ${NC}  ${WH}http://$domen:89/ssh-$Login.txt${NC}$RED $NC" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ${NC}    ${WH}• $author •${NC}                 $RED $NC" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo -e "$RED ◇━━━━━━━━━━━━━━━━━◇ ${NC}" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
echo "" | tee -a /etc/xray/sshx/akun/log-create-${Login}.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function renew(){
clear
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
#ISP=$(cat /etc/xray/isp)
#CITY=$(cat /etc/xray/city)
domain=$(cat /etc/xray/domain)
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/ssh")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
clear
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}             ${WH}• RENEW USERS •                    │${NC}$RED$NC"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│                                                 │"
echo -e "$RED│${WH} User Tidak Ada!                              $RED   │"
echo -e "$RED│                                                 │"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-sshovpn
fi
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}             ${WH}• RENEW USERS •                    │${NC}$RED$NC"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│ ${WH}Silahkan Pilih User Yang Mau di Renew$RED           │"
echo -e "$RED│ ${WH}ketik [0] kembali kemenu$RED                        │"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
grep -E "^### " "/etc/xray/ssh" | cut -d ' ' -f 2-3 | nl -s ') '
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
if [[ ${CLIENT_NUMBER} == '1' ]]; then
read -rp "Select one client [1]: " CLIENT_NUMBER
else
read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
if [[ ${CLIENT_NUMBER} == '0' ]]; then
m-sshovpn
fi
fi
done
User=$(grep -E "^### " "/etc/xray/ssh" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/ssh" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
Pass=$(grep -E "^### " "/etc/xray/ssh" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "Day Extend : " Days
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $Days))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
passwd -u $User
usermod -e  $exp4 $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
sed -i "s/### $User $exp/### $User $exp4/g" /etc/xray/ssh >/dev/null
clear
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  SSH RENEW</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>DOMAIN   :</b> <code>${domain} </code>
<b>ISP      :</b> <code>$ISP $CITY </code>
<b>USERNAME :</b> <code>$User </code>
<b>EXPIRED  :</b> <code>$exp4 </code>
<code>◇━━━━━━━━━━━━━━◇</code>
"
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
cd
if [ ! -e /etc/tele ]; then
echo -ne
else
echo "$TEXT" > /etc/notiftele
bash /etc/tele
fi
user2=$(echo "$User" | cut -c 1-3)
TIME2=$(date +'%Y-%m-%d %H:%M:%S')
TEXT2="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>   TRANSAKSI SUCCES </b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>DOMAIN   :</b> <code>${domain} </code>
<b>ISP      :</b> <code>$CITY </code>
<b>DATE   :</b> <code>${TIME2} WIB</code>
<b>DETAIL   :</b> <code>Trx SSH </code>
<b>USER :</b> <code>${user2}xxx </code>
<b>DURASI  :</b> <code>$Days Hari </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<i>Renew Account From Server..</i>
"
curl -s --max-time $TIMES -d "chat_id=$CHATID2&disable_web_page_preview=1&text=$TEXT2&parse_mode=html" $URL2 >/dev/null
clear
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}             ${WH}• RENEW USERS •                    │${NC}$RED$NC"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│"
echo -e "$RED│ ${WH}Username   : $User"
echo -e "$RED│ ${WH}Days Added : $Days Days"
echo -e "$RED│ ${WH}Expired on : $exp4"
echo -e "$RED│"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
fi
read -n 1 -s -r -p "Press any key to back on menu"
m-sshovpn
}
function hapus(){
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/ssh")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
clear
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}             ${WH}• DELETE USERS •                   │${NC}$RED$NC"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│                                                 │"
echo -e "$RED│${WH} User Tidak Ada!                              $RED   │"
echo -e "$RED│                                                 │"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-sshovpn
fi
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}             ${WH}• DELETE USERS •                   │${NC}$RED$NC"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│ ${WH}Silahkan Pilih User Yang Mau Didelete     $RED      │"
echo -e "$RED│ ${WH}ketik [0] kembali kemenu                     $RED   │"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
grep -E "^### " "/etc/xray/ssh" | cut -d ' ' -f 2-3 | nl -s ') '
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
if [[ ${CLIENT_NUMBER} == '1' ]]; then
read -rp "Select one client [1]: " CLIENT_NUMBER
else
read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
if [[ ${CLIENT_NUMBER} == '0' ]]; then
m-sshovpn
fi
fi
done
Pengguna=$(grep -E "^### " "/etc/xray/ssh" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
Days=$(grep -E "^### " "/etc/xray/ssh" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
Pass=$(grep -E "^### " "/etc/xray/ssh" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $Pengguna $Days $Pass/d" /etc/xray/ssh
rm /home/vps/public_html/ssh-$Pengguna.txt >/dev/null 2>&1
rm /etc/xray/sshx/${Pengguna}IP >/dev/null 2>&1
rm /etc/xray/sshx/${Pengguna}login >/dev/null 2>&1
if getent passwd $Pengguna > /dev/null 2>&1; then
userdel $Pengguna > /dev/null 2>&1
echo -e "User $Pengguna was removed."
else
echo -e "Failure: User $Pengguna Not Exist."
fi
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  DELETE SSH OVPN</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>DOMAIN   :</b> <code>${domain} </code>
<b>ISP      :</b> <code>$ISP $CITY </code>
<b>USERNAME :</b> <code>$Pengguna </code>
<b>EXPIRED  :</b> <code>$Days </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<i>Succes Delete This User...</i>
"
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
cd
if [ ! -e /etc/tele ]; then
echo -ne
else
echo "$TEXT" > /etc/notiftele
bash /etc/tele
fi
read -n 1 -s -r -p "Press any key to back on menu"
m-sshovpn
}
function cekconfig(){
#ISP=$(cat /etc/xray/isp)
#CITY=$(cat /etc/xray/city)
author=$(cat /etc/profil)
IP=$(curl -sS ifconfig.me);
domen=`cat /etc/xray/domain`
sldomain=`cat /etc/xray/dns`
slkey=`cat /etc/slowdns/server.pub`
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/ssh")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
clear
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}             ${WH}• USER CONFIG •                    │${NC}$RED$NC"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│                                                 │"
echo -e "$RED│${WH} User Tidak Ada!                              $RED   │"
echo -e "$RED│                                                 │"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-sshovpn
fi
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}             ${WH}• USER CONFIG •                    │${NC}$RED$NC"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│ ${WH}Silahkan Pilih User Yang Mau Dicek     $RED         │"
echo -e "$RED│ ${WH}ketik [0] kembali kemenu                     $RED   │"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
grep -E "^### " "/etc/xray/ssh" | cut -d ' ' -f 2-3 | nl -s ') '
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
if [[ ${CLIENT_NUMBER} == '1' ]]; then
read -rp "Select one client [1]: " CLIENT_NUMBER
else
read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
if [[ ${CLIENT_NUMBER} == '0' ]]; then
m-sshovpn
fi
fi
done
Login=$(grep -E "^### " "/etc/xray/ssh" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
cat /etc/xray/sshx/akun/log-create-${Login}.log
cat /etc/xray/sshx/akun/log-create-${Login}.log > /etc/notifakun
sed -i 's/\x1B\[1;37m//g' /etc/notifakun
sed -i 's/\x1B\[0;96m//g' /etc/notifakun
sed -i 's/\x1B\[0m//g' /etc/notifakun
TEXT=$(cat /etc/notifakun)
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
cd
if [ ! -e /etc/tele ]; then
echo -ne
else
echo "$TEXT" > /etc/notiftele
bash /etc/tele
fi
read -n 1 -s -r -p "   Press any key to back on menu"
menu
}
function hapuslama(){
clear
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED ${NC} ${RED}                 ${WH}• MEMBER SSH •                 ${NC}$RED$NC"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo "USERNAME          EXP DATE          STATUS"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "LOCKED"
else
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "UNLOCKED"
fi
fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo "Account number: $JUMLAH user"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED ${NC}${RED}              ${WH}• DELETE USERS •                   ${NC}$RED$NC"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo ""
read -p "Username SSH to Delete : " Pengguna
if getent passwd $Pengguna > /dev/null 2>&1; then
userdel $Pengguna > /dev/null 2>&1
echo -e "User $Pengguna was removed."
else
echo -e "Failure: User $Pengguna Not Exist."
fi
sed -i "/^### $Pengguna/d" /etc/xray/ssh
read -n 1 -s -r -p "Press any key to back on menu"
m-sshovpn
}
function cek(){
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
#ISP=$(cat /etc/xray/isp)
#CITY=$(cat /etc/xray/city)
domain=$(cat /etc/xray/domain)
author=$(cat /etc/profil)
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}             ${WH}• SSH ACTIVE USERS •              ${NC} $RED│ $NC"
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═════════════════════════════════════════════════╮${NC}"
echo -e ""
rm -rf /tmp/ssh2
systemctl restart ws-stunnel > /dev/null 2>&1
sleep 3
if [ -e "/var/log/auth.log" ]; then
LOG="/var/log/auth.log";
fi
cat /etc/passwd | grep "/home/" | cut -d":" -f1 > /etc/user.txt
username1=( `cat "/etc/user.txt" `);
i="0";
for user in "${username1[@]}"
do
username[$i]=`echo $user | sed 's/'\''//g'`;
jumlah[$i]=0;
i=$i+1;
done
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/log-db.txt
proc=( `ps aux | grep -i dropbear | awk '{print $2}'`);
for PID in "${proc[@]}"
do
cat /tmp/log-db.txt | grep "dropbear\[$PID\]" > /tmp/log-db-pid.txt
NUM=`cat /tmp/log-db-pid.txt | wc -l`;
USER=`cat /tmp/log-db-pid.txt | awk '{print $10}' | sed 's/'\''//g'`;
IP=`cat /tmp/log-db-pid.txt | awk '{print $12}'`;
if [ $NUM -eq 1 ]; then
TIME=$(date +'%H:%M:%S')
echo "$USER $TIME : $IP" >>/tmp/ssh2
i=0;
for user1 in "${username[@]}"
do
if [ "$USER" == "$user1" ]; then
jumlah[$i]=`expr ${jumlah[$i]} + 1`;
pid[$i]="${pid[$i]} $PID"
fi
i=$i+1;
done
fi
done
cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/log-db.txt
data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);
for PID in "${data[@]}"
do
cat /tmp/log-db.txt | grep "sshd\[$PID\]" > /tmp/log-db-pid.txt;
NUM=`cat /tmp/log-db-pid.txt | wc -l`;
USER=`cat /tmp/log-db-pid.txt | awk '{print $9}'`;
IP=`cat /tmp/log-db-pid.txt | awk '{print $11}'`;
if [ $NUM -eq 1 ]; then
TIME=$(date +'%H:%M:%S')
echo "$USER $TIME : $IP" >>/tmp/ssh2
i=0;
for user1 in "${username[@]}"
do
if [ "$USER" == "$user1" ]; then
jumlah[$i]=`expr ${jumlah[$i]} + 1`;
pid[$i]="${pid[$i]} $PID"
fi
i=$i+1;
done
fi
done
j="0";
for i in ${!username[*]}
do
limitip="0"
if [[ ${jumlah[$i]} -gt $limitip ]]; then
sship=$(cat /tmp/ssh2  | grep -w "${username[$i]}" | wc -l)
echo -e "$RED${NC} USERNAME : \033[0;33m${username[$i]}";
echo -e "$RED${NC} IP LOGIN : \033[0;33m$sship";
echo -e ""
fi
done
if [ -f "/etc/openvpn/server/openvpn-tcp.log" ]; then
echo " "
cat /etc/openvpn/server/openvpn-tcp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-tcp.txt
cat /tmp/vpn-login-tcp.txt
fi
if [ -f "/etc/openvpn/server/openvpn-udp.log" ]; then
echo " "
cat /etc/openvpn/server/openvpn-udp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-udp.txt
cat /tmp/vpn-login-udp.txt
fi
echo -e "$RED╰═════════════════════════════════════════════════╯${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-sshovpn
}
function limitssh(){
cd
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/ssh")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
clear
echo -e "$RED━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$RED ${NC}${RED}    ${WH}⇱ Limit SSH Account ⇲        ${NC} $RED $NC"
echo -e "$RED━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "You have no existing clients!"
echo ""
echo -e "$RED━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-sshovpn
fi
echo -e "$RED━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$RED ${NC}${RED}    ${WH}⇱ Limit SSH Account ⇲        ${NC} $RED $NC"
echo -e "$RED━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo "Select the existing client you want to change ip"
echo " ketik [0] kembali kemenu"
echo -e "$RED━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
grep -E "^### " "/etc/xray/ssh" | cut -d ' ' -f 2-3 | nl -s ') '
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
if [[ ${CLIENT_NUMBER} == '1' ]]; then
read -rp "Select one client [1]: " CLIENT_NUMBER
else
read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
if [[ ${CLIENT_NUMBER} == '0' ]]; then
m-sshovpn
fi
fi
done
until [[ $iplim =~ ^[0-9]+$ ]]; do
read -p "Limit User (IP) New: " iplim
done
if [ ! -e /etc/xray/sshx ]; then
mkdir -p /etc/xray/sshx
fi
if [ -z ${iplim} ]; then
iplim="0"
fi
user=$(grep -E "^### " "/etc/xray/ssh" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/ssh" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
echo "${iplim}" >/etc/xray/sshx/${user}IP
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  SSH IP LIMIT</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>DOMAIN   :</b> <code>${domain} </code>
<b>ISP      :</b> <code>$ISP $CITY </code>
<b>USERNAME :</b> <code>$user </code>
<b>EXPIRED  :</b> <code>$exp </code>
<b>IP LIMIT NEW :</b> <code>$iplim IP </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<i>Succes Change IP LIMIT...</i>
"
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
cd
if [ ! -e /etc/tele ]; then
echo -ne
else
echo "$TEXT" > /etc/notiftele
bash /etc/tele
fi
clear
echo -e "$RED━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo " SSH Account Was Successfully Change Limit IP"
echo -e "$RED━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo " Client Name : $user"
echo " Limit IP    : $iplim IP"
echo ""
echo -e "$RED━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-sshovpn
}
clear
function listssh(){
clear
echo -e "$RED╭══════════════════════════════════════════╮${NC}"
echo -e "$RED│ \033[1;37mPlease select a your Choice              $RED│${NC}"
echo -e "$RED╰══════════════════════════════════════════╯${NC}"
echo -e "$RED╭══════════════════════════════════════════╮${NC}"
echo -e "$RED│  [ 1 ]  \033[1;37mAUTO LOCKED USER SSH      ${NC}"
echo -e "$RED│  [ 2 ]  \033[1;37mAUTO DELETE USER SSH    ${NC}"
echo -e "$RED│  "
echo -e "$RED│  [ 0 ]  \033[1;37mBACK TO MENU    ${NC}"
echo -e "$RED╰══════════════════════════════════════════╯${NC}"
until [[ $lock =~ ^[0-2]+$ ]]; do
read -p "   Please select numbers 1 sampai 2 : " lock
done
if [[ $lock == "0" ]]; then
menu
elif [[ $lock == "1" ]]; then
clear
echo "lock" > /etc/typessh
echo -e "$RED╭═══════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}          ${WH}• SETTING MULTI LOGIN •            ${NC} $RED│ $NC"
echo -e "$RED╰═══════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═══════════════════════════════════════════════╮${NC}"
echo -e "$RED│$NC Succes Ganti Auto Lock  ${NC}"
echo -e "$RED│$NC Jika User Melanggar auto lock Account. ${NC}"
echo -e "$RED╰═══════════════════════════════════════════════╯${NC}"
sleep 1
elif [[ $lock == "2" ]]; then
clear
echo "delete" > /etc/typessh
echo -e "$RED╭═══════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}          ${WH}• SETTING MULTI LOGIN •            ${NC} $RED│ $NC"
echo -e "$RED╰═══════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═══════════════════════════════════════════════╮${NC}"
echo -e "$RED│$NC Succes Ganti Auto Delete Accounr ${NC}"
echo -e "$RED│$NC Jika User Melanggar auto Delete Account. ${NC}"
echo -e "$RED╰═══════════════════════════════════════════════╯${NC}"
sleep 1
fi
type=$(cat /etc/typessh)
if [ $type = "lock" ]; then
clear
echo -e "$RED╭═══════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}          ${WH}• SETTING MULTI LOGIN •            ${NC} $RED│ $NC"
echo -e "$RED╰═══════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═══════════════════════════════════════════════╮${NC}"
echo -e "$RED│$NC SILAHKAN TULIS JUMLAH WAKTU UNTUK LOCKED  ${NC}"
echo -e "$RED│$NC BISA TULIS 15 MENIT DLL. ${NC}"
echo -e "$RED╰═══════════════════════════════════════════════╯${NC}"
read -rp "   Jumlah Waktu Lock: " -e notif2
echo "${notif2}" > /etc/waktulockssh
clear
echo -e "$RED╭═══════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}          ${WH}• SETTING MULTI LOGIN •            ${NC} $RED│ $NC"
echo -e "$RED╰═══════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═══════════════════════════════════════════════╮${NC}"
echo -e "${RED}│ $NC SILAHKAN TULIS JUMLAH NOTIFIKASI UNTUK AUTO LOCK    ${NC}"
echo -e "${RED}│ $NC AKUN USER YANG MULTI LOGIN     ${NC}"
echo -e "$RED╰═══════════════════════════════════════════════╯${NC}"
read -rp "   Jika Mau 3x Notif baru kelock tulis 3, dst: " -e notif
cd /etc/xray/sshx
echo "$notif" > notif
clear
echo -e "$RED╭═══════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}          ${WH}• SETTING MULTI LOGIN •            ${NC} $RED│ $NC"
echo -e "$RED╰═══════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═══════════════════════════════════════════════╮${NC}"
echo -e "${RED}│ $NC SUCCES GANTI NOTIF LOCK JADI $notif $NC "
echo -e "${RED}│ $NC SUCCES GANTI TIME NOTIF LOCK JADI $notif2 MENIT $NC "
echo -e "$RED╰═══════════════════════════════════════════════╯${NC}"
else
echo -e "$RED╭═══════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}          ${WH}• SETTING MULTI LOGIN •            ${NC} $RED│ $NC"
echo -e "$RED╰═══════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═══════════════════════════════════════════════╮${NC}"
echo -e "$RED│$NC SILAHKAN TULIS JUMLAH WAKTU UNTUK UNTUK SCAN ${NC}"
echo -e "$RED│$NC USER YANG SEDANG MULTI LOGIN . ${NC}"
echo -e "$RED╰═══════════════════════════════════════════════╯${NC}"
read -rp "   Tulis Waktu Scan (Menit) : " -e notif2
echo "# Autokill" >/etc/cron.d/tendang
echo "SHELL=/bin/sh" >>/etc/cron.d/tendang
echo "PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin" >>/etc/cron.d/tendang
echo "*/$notif2 * * * *  root /usr/bin/tendang" >>/etc/cron.d/tendang
clear
echo -e "$RED╭═══════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}          ${WH}• SETTING MULTI LOGIN •            ${NC} $RED│ $NC"
echo -e "$RED╰═══════════════════════════════════════════════╯${NC}"
echo -e "$RED╭═══════════════════════════════════════════════╮${NC}"
echo -e "${RED}│ $NC SILAHKAN TULIS JUMLAH NOTIFIKASI UNTUK AUTO LOCK    ${NC}"
echo -e "${RED}│ $NC AKUN USER YANG MULTI LOGIN     ${NC}"
echo -e "$RED╰═══════════════════════════════════════════════╯${NC}"
read -rp "   Jika Mau 3x Notif baru kelock tulis 3, dst: " -e notif
cd /etc/xray/sshx
echo "$notif" > notif
clear
echo -e "$RED╭═══════════════════════════════════════════════╮${NC}"
echo -e "$RED│${NC} ${RED}          ${WH}• SETTING MULTI LOGIN •            ${NC} $RED│ $NC"
echo -e "$RED╰═══════════════════════════════════════════════╯{NC}"
echo -e "$RED╭═══════════════════════════════════════════════╮${NC}"
echo -e "${RED}│ $NC SUCCES GANTI NOTIF LOCK JADI $notif $NC "
echo -e "${RED}│ $NC SUCCES GANTI TIME NOTIF LOCK JADI $notif2 MENIT $NC "
echo -e "$RED╰═══════════════════════════════════════════════╯${NC}"
fi
read -n 1 -s -r -p "Press any key to back on menu"
m-sshovpn
}
function lockssh(){
clear
cd
if [ ! -e /etc/xray/sshx/listlock ]; then
echo "" > /etc/xray/sshx/listlock
fi
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/sshx/listlock")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
echo -e "$RED━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$RED ${NC}${RED}    ${WH}⇱ Unlock SSH Account ⇲       ${NC} $RED $NC"
echo -e "$RED━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "You have no existing user Lock!"
echo ""
echo -e "$RED━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
m-sshovpn
fi
clear
echo -e "$RED━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$RED ${NC}${RED}    ${WH}⇱ Unlock SSH Account ⇲       ${NC} $RED $NC"
echo -e "$RED━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo " Select the existing client you want to Unlock"
echo " ketik [0] kembali kemenu"
echo " tulis clear untuk delete semua Akun"
echo -e "$RED━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo "     No  User      Expired"
grep -E "^### " "/etc/xray/sshx/listlock" | cut -d ' ' -f 2-3 | nl -s ') '
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
if [[ ${CLIENT_NUMBER} == '1' ]]; then
read -rp "Select one client [1]: " CLIENT_NUMBER
else
read -rp "Select one client [1-${NUMBER_OF_CLIENTS}] to Unlock: " CLIENT_NUMBER
if [[ ${CLIENT_NUMBER} == '0' ]]; then
m-sshovpn
fi
if [[ ${CLIENT_NUMBER} == 'clear' ]]; then
rm /etc/xray/sshx/listlock
m-sshovpn
fi
fi
done
user=$(grep -E "^### " "/etc/xray/sshx/listlock" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/sshx/listlock" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
pass=$(grep -E "^### " "/etc/xray/sshx/listlock" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
passwd -u $user &> /dev/null
echo -e "### $Login $exp $Pass" >> /etc/xray/ssh
sed -i "/^### $user $exp $pass/d" /etc/xray/sshx/listlock &> /dev/null
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  SSH UNLOK </b>
<code>◇━━━━━━━━━━━━━━◇
<b>DOMAIN   :</b> <code>${domain} </code>
<b>ISP      :</b> <code>$ISP $CITY </code>
<b>USERNAME :</b> <code>$user </code>
<b>IP LIMIT  :</b> <code>$iplim IP </code>
<b>EXPIRED  :</b> <code>$exp </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<i>Succes Unlock Akun...</i>
"
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
cd
if [ ! -e /etc/tele ]; then
echo -ne
else
echo "$TEXT" > /etc/notiftele
bash /etc/tele
fi
clear
echo -e "$RED━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo " SSH Account Unlock Successfully"
echo -e "$RED━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo " Client Name : $user"
echo " Status  : Unlocked"
echo -e "$RED━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-sshovpn
}
clear
author=$(cat /etc/profil)
echo -e " $RED╭════════════════════════════════════════════════════╮${NC}"
echo -e " $RED│${NC} ${RED}            ${WH}• SSH PANEL MENU •                    ${NC} $RED│ $NC"
echo -e " $RED╰════════════════════════════════════════════════════╯${NC}"
echo -e " $RED╭════════════════════════════════════════════════════╮${NC}"
echo -e " $RED│ $NC  ${WH}[${RED}01${WH}]${NC} ${RED}• ${WH}ADD AKUN${NC}        ${WH}[${RED}05${WH}]${NC} ${RED}• ${WH}CEK USER ONLINE${NC}    $RED│ $NC"
echo -e " $RED│ $NC  ${WH}[${RED}02${WH}]${NC} ${RED}• ${WH}TRIAL AKUN${NC}      ${WH}[${RED}06${WH}]${NC} ${RED}• ${WH}CEK USER CONFIG${NC}    $RED│ $NC"
echo -e " $RED│ $NC  ${WH}[${RED}03${WH}]${NC} ${RED}• ${WH}RENEW AKUN${NC}      ${WH}[${RED}07${WH}]${NC} ${RED}• ${WH}CHANGE IP LIMIT${NC}    $RED│ $NC"
echo -e " $RED│ $NC  ${WH}[${RED}04${WH}]${NC} ${RED}• ${WH}DELETE AKUN${NC}     ${WH}[${RED}08${WH}]${NC} ${RED}• ${WH}SETTING LOCK LOGIN${NC} $RED│ $NC"
echo -e " $RED│ $NC  ${WH}[${RED}00${WH}]${NC} ${RED}• ${WH}GO BACK${NC}         ${WH}[${RED}09${WH}]${NC} ${RED}• ${WH}UNLOCK LOGIN${NC}      $RED │$NC"
echo -e " $RED╰════════════════════════════════════════════════════╯${NC}"
echo -e " $RED╭═════════════════════════ ${WH}BY${NC} ${RED}═══════════════════════╮ ${NC}"
echo -e "  $RED${NC}              ${WH}   • $author •                 $RED $NC"
echo -e " $RED╰════════════════════════════════════════════════════╯${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${RED}: ${WH}"; read opt
case $opt in
01 | 1) clear ; usernew ; exit ;;
02 | 2) clear ; trial ; exit ;;
03 | 3) clear ; renew ; exit ;;
04 | 4) clear ; hapus ; exit ;;
05 | 5) clear ; cek ; exit ;;
06 | 6) clear ; cekconfig ; exit ;;
07 | 7) clear ; limitssh; exit ;;
08 | 8) clear ; listssh ; exit ;;
09 | 9) clear ; lockssh ; exit ;;
10 | 10) clear ; hapuslama ; exit ;;
00 | 0) clear ; menu ; exit ;;
X  | 0) clear ; m-sshovpn ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; m-sshovpn ;;
esac
