
#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] Downloading Update File"
sleep 2
# hapus menu
rm -rf /usr/local/bin/ws-openssh
rm -rf /usr/local/bin/ws-dropbear
rm -rf /usr/local/bin/ws-stunnel
rm -rf /usr/local/bin/edu-proxy


rm -rf /etc/systemd/system/ws-openssh.service
rm -rf /etc/systemd/system/ws-dropbear.service
rm -rf /etc/systemd/system/ws-stunnel.service
rm -rf /etc/systemd/system/edu-proxy.service

curl "https://raw.githubusercontent.com/awanklod/alvi3/main/sshws/insshws.sh" | bash
echo -e " [INFO] Update Successfully"
sleep 2
menu
