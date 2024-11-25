#!/bin/zsh

echo -e "\e[5;1;97;41mAll the setups after booting\e[0m"

echo && echo -e "\e[96m1.1 pacman\e[0m" && echo
echo -e "\e[95m1.1.1 update\e[0m"
sudo pacman -Syu
echo -e "\e[95m1.1.2 orphan package remove\e[0m"
if [[ $(pacman -Qdtq) ]]; then sudo pacman -Rns $(pacman -Qdtq); else echo "No orphaned packages to remove."; fi
# cache clean can be done
# sudo pacman -Sc

echo && echo -e "\e[96m1.2 yay\e[0m" && echo
sleep 2
echo -e "\e[95m1.2.1 update\e[0m"
yay -Syu
echo -e "\e[95m1.2.2 orphan package remove\e[0m"
yay -Yc
# cache clean can be done
# yay -Sc

echo && echo -e "\e[96m2. charging limit 79%\e[0m" && echo
sleep 2
cd ~/Documents/battery-charging-limiter-linux/
sudo ./limit.sh 80

echo && echo -e "\e[96m5. sleep then exit\e[0m" && echo
sleep 5
exit
