clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vm# " "/etc/vmess/.vmess.db")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
                clear
        echo -e "\033[35m━━━━━━━━━━━━━━━━━━━━━━क⊹⊱ꕥ⊰⊹क━━━━━━━━━━━━━━━━━━━━━━\e[0m"
        echo -e "           Edit Quota Vmess          \E[0m"
        echo -e "\033[35m━━━━━━━━━━━━━━━━━━━━━━क⊹⊱ꕥ⊰⊹क━━━━━━━━━━━━━━━━━━━━━━\e[0m"
                echo ""
                echo "You have no existing clients!"
                echo ""
                echo -e "\033[35m━━━━━━━━━━━━━━━━━━━━━━क⊹⊱ꕥ⊰⊹क━━━━━━━━━━━━━━━━━━━━━━\e[0m"
        echo ""
        read -n 1 -s -r -p "Press any key to back on menu"
        menu
        fi

        clear
        echo -e "\033[35m━━━━━━━━━━━━━━━━━━━━━━क⊹⊱ꕥ⊰⊹क━━━━━━━━━━━━━━━━━━━━━━\e[0m"
    echo -e "           Edit Quota Vmess          \E[0m"
    echo -e "\033[35m━━━━━━━━━━━━━━━━━━━━━━क⊹⊱ꕥ⊰⊹क━━━━━━━━━━━━━━━━━━━━━━\e[0m"
    echo ""
        grep -E "^#vm# " "/etc/vmess/.vmess.db" | cut -d ' ' -f 2 | column -t | sort | uniq
    echo ""
    red "tap enter to go back"
    echo -e "\033[35m━━━━━━━━━━━━━━━━━━━━━━क⊹⊱ꕥ⊰⊹क━━━━━━━━━━━━━━━━━━━━━━\e[0m"
        read -rp "Input Username : " user
    if [ -z $user ]; then
    menu
    else
    read -p "Limit (Quota): " Quota
    echo -e "$[$Quota * 1024 * 1024 * 1024]" > /etc/vmess/${user}
    clear
    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo " VMESS Account Was Successfully Edited"
    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo " Client Name  : $user"
    echo " Quota Ready  : $Quota GB"
    echo ""
    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    menu-vmess
    fi
