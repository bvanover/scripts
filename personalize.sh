#!/bin/bash

# makes sure the sys is up to date before installing software
dnf update -y

# clones the appropriate repo, bvanover/fedconfs
git clone https://github.com/bvanover/fedconfs

# installs flakpak, Discord, Spotify, & Steam
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y
flatpak install flathub com.valvesoftware.Steam -y
flatpak install com.discordapp.Discord -y 
flatpak install flathub  com.spotify.Client -y

# installs htop (resource monitor), alacritty (terminal emulator), swaybg (background/wallpaper tool), rofi (application launcher), & cava (visualizer)
dnf install alacritty swaybg cava rofi htop -y

# installs hyprland and required tools from COPR
dnf copr enable solopasha/hyprland -y
dnf install hyprland hyprshot -y
dnf install waybar-hyprland -y

# installs spotify-tui & sublime-text
dnf copr enable atim/spotify-tui -y
dnf install spotify-tui -y
rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg -y
dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo -y
dnf install sublime-text -y

# deletes existing/premade directories and configurations and replaces them with fedconfs/

rm -r .config/alacritty -y
rm -r .config/rofi -y
rm -r .config/hypr -y
rm -r .config/spotify-tui -y
rm /etc/dnf/dnf.conf -y 
rm /etc/xdg/waybar/style.css -y
rm /etc/xdg/waybar/config -y

mv fedconfs/alacritty .config/ -y
mv fedconfs/hypr .config/ -y
mv fedconfs/rofi .config/ -y
mv fedconfs/spotify-tui .config/ -y
mv fedconfs/dnf.conf /etc/dnf/ -y
mv fedconfs/config etc/xdg/waybar/ -y
mv fedconfs/style.css etc/xdg/waybar/ -y
mv fedconfs/wp ~/wp -y