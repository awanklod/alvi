#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
#########################
# Color Validation
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
Yellow='\033[0;93'
NC='\e[0m'
# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[44;1;39m     🎮 CLOUDVPN TUNNEL 🎮            \E[0m" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "${BICyan} ┌────────────────────────────────────┐${NC}"
echo -e "       ${BIWhite}${UWhite}SHADOWSOCKS ${NC}"
echo -e ""
echo -e "${CYAN}╒════════════════════════════════════════╕${NC}"
echo -e "${BICyan}[${BIWhite}01${BICyan}]${RED} • ${NC}${BIWhite}ADD SHADOWSOCKS  $NC"
echo -e "${BICyan}[${BIWhite}02${BICyan}]${RED} • ${NC}${BIWhite}TRIAL SHADOWSOCKS  $NC"
echo -e "${BICyan}[${BIWhite}03${BICyan}]${RED} • ${NC}${BIWhite}EXTEND SHADOWSOCKS  $NC"
echo -e "${BICyan}[${BIWhite}04${BICyan}]${RED} • ${NC}${BIWhite}DELETE SHADOWSOCKS  $NC"
#echo -e "${BICyan}[${BIWhite}05${BICyan}]${RED} • ${NC}${BIWhite}CHECK SHADOWSOCKS  $NC"
echo -e "${BICyan}[${BIWhite}06${BICyan}]${RED} • ${NC}${BIWhite}CHECK SHADOWSOCKS 2  $NC"
#echo -e "${BICyan}[${BIWhite}07${BICyan}]${RED} • ${NC}${BIWhite}CHECK SHADOWSOCKS 3  $NC"

echo -e "${CYAN}╘════════════════════════════════════════╛${NC}"
echo -e ""
echo -e "${BICyan}[${BIWhite}0 ${BICyan}]${RED} • ${NC}${CYAN}BACK MENU $NC"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo ""
echo -e "${CYAN}══════════════════════════════════════════${NC}"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-ssws ;;
2) clear ; trialssws ;;
3) clear ; renew-ssws ;;
4) clear ; del-ssws ;;
#5) clear ; cek-ssws ;;
6) clear ; cek-ssws2 ;;
#7) clear ; cek-ssws3 ;;

0) clear ; menu ;;
x) exit ;;
*) echo "Masukkan Angka Yang Benar" ; sleep 1 ; menu-ssws ;;
esac
