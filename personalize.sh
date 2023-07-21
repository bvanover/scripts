#!/bin/bash

# clones the appropriate repo, bvanover/fedconfs && moves dnf.conf so that everything will be *much* quicker
git clone https://github.com/bvanover/fedconfs
rm /etc/dnf/dnf.conf 
mv ~/fedconfs/dnf.conf /etc/dnf/

# makes sure the sys is up to date before installing software
dnf update -y

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
rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg 
dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo -y
dnf install sublime-text -y

# deletes existing/premade directories and configurations and replaces them with fedconfs/
rm -r ~/.config/alacritty 
rm -r ~/.config/rofi 
rm -r ~/.config/hypr 
rm -r ~/.config/spotify-tui 
rm /etc/xdg/waybar/style.css 
rm /etc/xdg/waybar/config 

mv ~/fedconfs/alacritty ~/.config 
mv ~/fedconfs/hypr ~/.config 
mv ~/fedconfs/rofi ~/.config 
mv ~/fedconfs/spotify-tui ~/.config 
mv ~/fedconfs/config /etc/xdg/waybar 
mv ~/fedconfs/style.css /etc/xdg/waybar 
mv ~/fedconfs/wp ~/ 
