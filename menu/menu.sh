#!/bin/bash
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
MYIP=$(wget -qO- ifconfig.me)
colornow=$(cat /etc/rmbl/theme/color.conf)
export NC="\e[0m"
export yl='\033[0;33m';
export RED="\033[0;31m"
export COLOR1="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
tram=$( free -h | awk 'NR==2 {print $2}' )
uram=$( free -h | awk 'NR==2 {print $3}' )
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
author=$(cat /etc/profil)
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
MYIP=$(wget -qO- ifconfig.me)
Isadmin=$(curl -sS https://raw.githubusercontent.com/awanklod/izin_reaz/main/izin | grep $MYIP | awk '{print $5}')
Exp2=$(curl -sS https://raw.githubusercontent.com/awanklod/izin_reaz/main/izin | grep $MYIP | awk '{print $3}')
export RED='\033[0;31m'
export GREEN='\033[0;32m'
Name=$(curl -sS https://raw.githubusercontent.com/awanklod/izin_reaz/main/izin | grep $MYIP | awk '{print $2}')
ipsaya=$(wget -qO- ifconfig.me)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/awanklod/izin_reaz/main/izin"
checking_sc() {
useexp=$(curl -sS $data_ip | grep $ipsaya | awk '{print $3}')
if [[ $date_list < $useexp ]]; then
echo -ne
else
systemctl stop nginx
echo -e "$COLOR1╭═════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│${NC}${COLBG1}          ${WH}• AUTOSCRIPT PREMIUM •                 ${NC}$COLOR1│ $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════╯${NC}"
echo -e "$COLOR1╭═════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│            ${RED}PERMISSION DENIED !${NC}                  $COLOR1│"
echo -e "$COLOR1│   ${yl}Your VPS${NC} $ipsaya \033[0;36mHas been Banned ${NC}      $COLOR1│"
echo -e "$COLOR1│     ${yl}Buy access permissions for scripts${NC}          $COLOR1│"
echo -e "$COLOR1│             \033[0;32mContact Your Admin ${NC}                 $COLOR1│"
echo -e "$COLOR1╰═════════════════════════════════════════════════╯${NC}"
exit
fi
}
checking_sc
madmin=$(curl -sS https://raw.githubusercontent.com/awanklod/izin_reaz/main/izin | grep $MYIP | awk '{print $5}')
cd
if [ ! -e /etc/per/id ]; then
mkdir -p /etc/per
echo "" > /etc/per/id
echo "" > /etc/per/token
elif [ ! -e /etc/perlogin/id ]; then
mkdir -p /etc/perlogin
echo "" > /etc/perlogin/id
echo "" > /etc/perlogin/token
elif [ ! -e /usr/bin/id ]; then
echo "" > /usr/bin/idchat
echo "" > /usr/bin/token
fi
if [ ! -e /etc/xray/ssh ]; then
echo "" > /etc/xray/ssh
elif [ ! -e /etc/xray/sshx ]; then
mkdir -p /etc/xray/sshx
elif [ ! -e /etc/xray/sshx/listlock ]; then
echo "" > /etc/xray/sshx/listlock
elif [ ! -e /etc/vmess ]; then
mkdir -p /etc/vmess
elif [ ! -e /etc/vmess/listlock ]; then
echo "" > /etc/vmess/listlock
elif [ ! -e /etc/vless ]; then
mkdir -p /etc/vless
elif [ ! -e /etc/vless/listlock ]; then
echo "" > /etc/vless/listlock
elif [ ! -e /etc/trojan ]; then
mkdir -p /etc/trojan
elif [ ! -e /etc/trojan/listlock ]; then
echo "" > /etc/trojan/listlock
#elif [ ! -e /etc/xray/noob ]; then
#echo "" > /etc/xray/noob
elif [ ! -e /etc/trojan-go/trgo ]; then
echo "" > /etc/trojan-go/trgo
fi
clear

# STATUS EXPIRED ACTIVE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[4$below" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}(Registered)${Font_color_suffix}"
Error="${Green_font_prefix}${Font_color_suffix}${Red_font_prefix}[EXPIRED]${Font_color_suffix}"

today=$(date -d "0 days" +"%Y-%m-%d")
if [[ $today < $Exp2 ]]; then
    sts="${Info}"
else
    sts="${Error}"
fi
# TOTAL CREATE ACC VMESS
vmess=$(grep -c -E "^#vmg " "/etc/xray/config.json")
# TOTAL CREATE ACC VLESS
vless=$(grep -c -E "^#vlg " "/etc/xray/config.json")
# TOTAL CREATE ACC TROJAN
trtls=$(grep -c -E "^#trg " "/etc/xray/config.json")
# TOTAL CREATE ACC SHADOWSOCKS
ssx=$(grep -c -E "^## " "/etc/xray/config.json")
let ssa=$ssx/2
# TOTAL CREATE ACC SSH
total_ssh=$(grep -c -E "^### " "/etc/xray/ssh")
# TOTAL CREATE ACC NOOBZ
#jumlah_noobz=$(grep -c -E "^### " "/etc/xray/noob")
# TOTAL CREATE ACC TROJAN-GO
jumlah_trgo=$(grep -c -E "^### " "/etc/trojan-go/trgo")

UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
# // Exporting Language to UTF-8
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
clear

# // Exporting Language to UTF-8

export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'


# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"
# TOTAL RAM
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))
USAGERAM=$(free -m | awk 'NR==2 {print $3}')

persenmemori="$(echo "scale=2; $usmem*100/$tomem" | bc)"
#persencpu=
persencpu="$(echo "scale=2; $cpu1+$cpu2" | bc)"

# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"


# // Clear
clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}ON${NC}"
else
ressh="${red}OFF${NC}"
fi
sshstunel=$(service stunnel4 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ON${NC}"
else
resst="${red}OFF${NC}"
fi
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
ressshws="${green}ON${NC}"
else
ressshws="${red}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ON${NC}"
else
resngx="${red}OFF${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${green}ON${NC}"
else
resdbr="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ON${NC}"
else
resv2r="${red}OFF${NC}"
fi
function addhost(){
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -rp "Domain/Host: " -e host
echo ""
if [ -z $host ]; then
echo "????"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
setting-menu
else
echo "IP=$host" > /var/lib/SIJA/ipvps.conf
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "Dont forget to renew cert"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi
}
function genssl(){
clear
systemctl stop nginx
domain=$(cat /var/lib/SIJA/ipvps.conf | cut -d'=' -f2)
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${red}WARNING${NC} ] Detected port 80 used by $Cek " 
systemctl stop $Cek
sleep 2
echo -e "[ ${green}INFO${NC} ] Processing to stop $Cek " 
sleep 1
fi
echo -e "[ ${green}INFO${NC} ] Starting renew cert... " 
sleep 2
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
echo -e "[ ${green}INFO${NC} ] Renew cert done... " 
sleep 2
echo -e "[ ${green}INFO${NC} ] Starting service $Cek " 
sleep 2
echo $domain > /etc/xray/domain
systemctl restart xray
systemctl restart nginx
echo -e "[ ${green}INFO${NC} ] All finished... " 
sleep 0.5
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
export sem=$( curl -s https://raw.githubusercontent.com/ALVIICELL/permission/main/versions)
export pak=$( cat /home/.ver)
IPVPS=$(curl -s ipinfo.io/ip )
clear
#figlet  PREMIUM  | lolcat
#echo -e "${BIPurple}╔══════════════════════════════════════════════════════════╗\033[0m${NC}"
#echo -e "${BIRed}                       CLOUDVPN  TUNNEL                      ${NC}"
#echo -e "${BIPurple}╚══════════════════════════════════════════════════════════╝\033[0m${NC}"
echo -e "${BIYellow}╔═══════════════════════════════════════════════════════════╗${NC}"
echo -e "${BIYellow}║$NC\033[41m         Welcome To Script Premium CLOUDVPNSTORE           $NC${BIYellow}║$NC"
echo -e "${BIYellow}╚═══════════════════════════════════════════════════════════╝${NC}"
echo -e "${BIYellow}╔═══════════════════════════════════════════════════════════╗\033[0m${NC}"
echo -e "${BIYellow}║ Server Uptime       = ${BIWhite}$( uptime -p  | cut -d " " -f 2-10000 ) ${NC}"
echo -e "${BIYellow}║ Current Time        = ${BIWhite}$( date -d "0 days" +"%d-%m-%Y | %X" )${NC}"
echo -e "${BIYellow}║ Operating System    = ${BIWhite}$( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' ) ( $( uname -m) )${NC}"
echo -e "${BIYellow}║ IP VPS              = ${BIWhite}$IPVPS${NC}"
echo -e "${BIYellow}║ Current Domain      = ${BIWhite}$( cat /etc/xray/domain )${NC}"
echo -e "${BIYellow}║ NS Domain           = ${BIWhite}$(cat /root/nsdomain)${NC}"
echo -e "${BIYellow}║ RAM/USE RAM % CPU   = ${BIWhite}${totalram}MB / ${BIWhite}${USAGERAM} MB & ${BIWhite}${cpu_usage}${NC}"
#echo -e "${BIYellow}║ CPU Usage           = ${BIWhite}${cpu_usage}${NC}"
echo -e "${BIYellow}╚═══════════════════════════════════════════════════════════╝\033[0m${NC}"
DATE=$(date +'%d %B %Y')
DATE=$(date +'%Y-%m-%d')
datediff() {
d1=$(date -d "$1" +%s)
d2=$(date -d "$2" +%s)
echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
d1=$(date -d "$Exp2" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))


echo -e "$COLOR1╭═════════════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│$NC ${WH} ❈ Client ${NC} : ${WH}$author${NC}"
echo -e "$COLOR1│$NC ${WH} ❈ Durasi ${NC} : ${WH}$certificate hari${NC}$COLOR1"
echo -e "$COLOR1│$NC ${WH} ❈ Expiry ${NC} : ${WH}$Exp2 $sts ${NC}$COLOR1"
echo -e "$COLOR1╰═════════════════════════════════════════════════════════╯${NC}"
echo -e " ${BIWhite}                 SSH OVPN: $ssh1  VMESS: $vma $NC"
echo -e " ${BIWhite}              VLESS: $vla TROJAN: $tra SHADWSK: $ssa $NC"
echo -e "${BIBlack}╔═════════════════════════════════════════════════════════╗${NC}"
echo -e "      ${red}SSH Websocket${NC} : $ressshws""   ${red}NGINX${NC} : $resngx""  ${red}XRAY${NC} : $resv2r"
echo -e "${BIBlack}╚═════════════════════════════════════════════════════════╝${NC}"
#echo -e "     ${BICyan} SSH ${NC}: $ressh"" ${BICyan} NGINX ${NC}: $resngx"" ${BICyan}  XRAY ${NC}: $resv2r"" ${BICyan} TROJAN ${NC}: $resv2r"
#echo -e "   ${BICyan}     STUNNEL4 ${NC}: $resst" "${BICyan} DROPBEAR ${NC}: $resdbr" "${BICyan} SSH-WS ${NC}: $ressshws"
echo -e "${BIYellow}   ╔══════════════════════════════════════════════════════╗${NC}"
echo -e "     ${BIYellow}[${BIWhite}1]${red}🌦 SSH    " "  ${BICyan}[${BIWhite}6]${red}🌦 SETTING  " " ${BICyan}[${BIWhite}11${red}]🌦 SET REBOOT"
echo -e "     ${BIYellow}[${BIWhite}2]${red}🌦 VMESS  " "  ${BICyan}[${BIWhite}7]${red}🌦 TRIAL    " " ${BICyan}[${BIWhite}12${red}]🔐 SET PW VPS"
echo -e "     ${BIYellow}[${BIWhite}3]${red}🌦 VLESS  " "  ${BICyan}[${BIWhite}8]${red}🌦 BACKUP   " " ${BICyan}[${BIWhite}13${red}]🌦 UPDATE SC "
echo -e "     ${BIYellow}[${BIWhite}4]${red}🌦 TROJAN " "  ${BICyan}[${BIWhite}9]${red}🌦 ADD-HOST " " ${BICyan}[${BIWhite}99${red}]🌦 CLEAR SAMPAH"
echo -e "     ${BIYellow}[${BIWhite}5]${red}🌦 SHDSCK " "  ${BICyan}[${BIWhite}10]${red}🌦 RUNNING"
echo -e "${BIYellow}   ╚══════════════════════════════════════════════════════╝${NC}"
echo -e "${BIBlack} ╔═════════════════════════════════════════════════════╗${NC}"
echo -e "${BIBlack} ║$NC ${IWhite}TODAY${NC}: ${red}$ttoday$NC ${IWhite}YESTERDAY${NC}: ${red}$tyest$NC ${IWhite}MONTHLY${NC}: ${red}$tmon$NC $NC"
echo -e "${BIBlack} ╚═════════════════════════════════════════════════════╝${NC}"
echo
read -p " Choose menu Leader : " opt
echo -e ""
case $opt in
1) clear ; menu-ssh ;;
2) clear ; menu-vmess ;;
3) clear ; menu-vless ;;
4) clear ; menu-trojan ;;
5) clear ; menu-ssws ;;
6) clear ; menu-set ;;
7) clear ; menu-trial ;;
8) clear ; menu-backup ;;
9) clear ; addhost ;;
10) clear ; running ;;
11) clear ; jam ;;
12) clear ; passwd ;;
13) clear ; up ;;
99) clear ; clearcache ;;
6969) clear ; wget https://raw.githubusercontent.com/ALVIICELL/1/main/update.sh && chmod +x update.sh && ./update.sh && rm -f /root/update.sh ;;
0) clear ; menu ;;
x) exit ;;
esac
