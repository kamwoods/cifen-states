#!/bin/bash

if [[ $(lsb_release -c -s) == jammy ]]; then
  gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/cifen/resources/images/CIFEN-Wallpaper.png'
  gsettings set org.gnome.desktop.background picture-uri-dark 'file:///usr/share/cifen/resources/images/CIFEN-Wallpaper.png'
  gsettings set org.gnome.shell favorite-apps "['firefox_firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop']"

elif [[ $(lsb_release -c -s) == noble ]]; then
  gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/cifen/resources/images/CIFEN-Wallpaper.png'
  gsettings set org.gnome.desktop.background picture-uri-dark 'file:///usr/share/cifen/resources/images/CIFEN-Wallpaper.png'
  gsettings set org.gnome.shell favorite-apps "['firefox_firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop']"
fi

gsettings set org.gnome.desktop.background picture-options 'zoom'
gsettings set org.gnome.desktop.background show-desktop-icons true
gsettings set org.gnome.desktop.media-handling automount false
gsettings set org.gnome.desktop.media-handling automount-open false
gsettings set org.gnome.shell enabled-extensions "['ubuntu-appindicators@ubuntu.com', 'ubuntu-dock@ubuntu.com', 'desktop-icons@csoriano', 'apps-menu@gnome-shell-extensions.gcampax.github.com', 'user-theme@gnome-shell-extensions.gcampax.github.com']"
gsettings set org.gnome.shell.extensions.dash-to-dock custom-background-color true
gsettings set org.gnome.shell.extensions.dash-to-dock background-color '#0E1B26'
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 40
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity '0.3'
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots true
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style 'DASHES'
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#4682b4'
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts true
trust=true

dconf load /org/gnome/terminal/legacy/profiles:/ < /usr/share/cifen/resources/terminal-profile-dark.txt
rm /home/$(whoami)/.config/autostart/cifen-theme.desktop
