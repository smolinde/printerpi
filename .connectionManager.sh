#!/bin/bash
#
# DO NOT MODIFY ANYTHING HERE UNLESS YOU KNOW WHAT YOU ARE DOING!
#
# This Bash script is responsible for the network management. It ensures that the
# device is always reachable. Through the .connectionfile the script receives the
# desired network a user wants to connect with. It is executed once every minute
# via crontab. Run
#
# crontab -e
#
# to open the cron file. There you will find the following line:
#
# * * * * * sudo nohup bash /home/printerpi/.connectionManager.sh >/dev/null 2>&1 &
#
# To save battery, change the job execution frequency accordingly. (NOT RECOMMENDED)

network="$(head -n 1 .connectionfile)"
if [[ $network != '' ]]; then
        > .connectionfile
        if [[ $network == 'Hotspot' ]]; then
                sudo nohup $(sleep 10 && sudo nmcli con up Hotspot) > /dev/null 2>&1 &
        else
                sudo nohup $(sleep 10 && sudo nmcli con up "$network") > /dev/null 2>&1 &
        fi
        sleep 30
fi
active="$(sudo nmcli -t -f NAME c show --active)"
if [[ $active != '' ]]; then
        if [[ $active != 'Hotspot' ]]; then
                status=$(sudo nmcli -f GENERAL.STATE con show "$active")
                if [[ $status != *"activated" ]]; then
                        sudo nohup $(sudo nmcli con down "$active" && sudo nmcli con up Hotspot) > /dev/null 2>&1 &
                fi
        fi
else
        sudo nmcli con up Hotspot
fi