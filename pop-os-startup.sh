#!/bin/zsh

echo -e "\e[5;1;97;41mAll the setups after booting\e[0m"

echo && echo -e "\e[96m1.1 apt\e[0m" && echo
echo -e "\e[95m1.1.1 update\e[0m"
sudo apt update
echo -e "\e[95m1.1.2 upgrade --purge\e[0m"
sudo apt upgrade -y
echo -e "\e[95m1.1.3 autoremove --purge\e[0m"
sudo apt autoremove --purge -y

echo && echo -e "\e[96m1.2 flatpak update, uninstall --unused --delete-data\e[0m" && echo
sleep 2
echo -e "\e[95m1.2.1user wide update\e[0m"
flatpak update -y
echo -e "\e[95m1.2.2user wide uninstall --unused --delete-data\e[0m"
flatpak uninstall --unused --delete-data
echo -e "\e[95m1.2.1system wide update\e[0m"
sudo flatpak update -y
echo -e "\e[95m1.2.2system wide uninstall --unused --delete-data\e[0m"
sudo flatpak uninstall --unused --delete-data

echo && echo -e "\e[96m2. limit.sh 80\e[0m" && echo
sleep 2
cd ~/Documents/battery-charging-limiter-linux/
sudo ./limit.sh 80

echo && echo -e "\e[96m3. asus-keyboard-backlight.sh down\e[0m" && echo
sleep 2
sudo /etc/acpi/asus-keyboard-backlight.sh down

echo && echo -e "\e[96m4. omz update\e[0m" && echo
sleep 2
ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
omz update

echo && echo -e "\e[96m5. sleep then exit\e[0m" && echo
sleep 5
exit
