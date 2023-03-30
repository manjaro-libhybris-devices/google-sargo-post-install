#!/bin/sh
# This is the post install script for Google sargo/bonito!

# Set chassis
hostnamectl set-chassis handset

# Update system users
systemd-sysusers

# Add /system symlink
ln -s /android/system /system

# Add users
[[ $(pacman -Q plasma-mobile-settings 2>/dev/null) ]] && USER='kde' || USER='manjaro'
echo "$USER" > /tmp/user
echo "123456" > /tmp/password
echo "root" > /tmp/rootpassword
if [ ! -f /usr/bin/pico-wizard ]; then
    groupadd --gid 32011 $(cat /tmp/user)
    useradd --uid 32011 --gid 32011 -m -g users -G autologin,wheel,sys,audio,input,video,storage,lp,network,users,power,rfkill,system,radio,android_input,android_graphics,android_audio -p $(openssl passwd -6 $(cat /tmp/password)) \
    -s /bin/bash $(cat /tmp/user) 1> /dev/null 2>&1
fi
awk -i inplace -F: "BEGIN {OFS=FS;} \$1 == \"root\" {\$2=\"$(openssl passwd -6 $(cat /tmp/rootpassword))\"} 1" /etc/shadow 1> /dev/null 2>&1
rm /tmp/user /tmp/password /tmp/rootpassword

# Update appstream DB
[[ -e /usr/bin/appstreamcli ]] && /usr/bin/appstreamcli refresh-cache --force

# Set locales
localectl set-locale "en_US.UTF-8"

# Set the manjaro theme for plymouth
plymouth-set-default-theme manjaro

# Gloabally enable audiosystem-passthrough on first boot
systemctl --global enable audiosystem-passthrough

# Disable this service, so it only gets run on first boot
systemctl disable google-sargo-post-install.service

# Start phosh
[[ -e /usr/bin/phosh ]] && systemctl start phosh
