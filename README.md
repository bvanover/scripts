I developed this script primarily for a "set it and forget it" installation of Fedora wherein I could begin the script once the core system was installed and then walk away until it was finished.

The script should be run with sudo.

At no point should the script ask for permission for doing anything: installing packages, updates, & movement of configuration files should all happen without user input.
If this is not your desired behavior and you would like to see each package being installed or confirm what you are/are not comfortable with, you can simply edit the script.
To stop the script from assuming you give permission for every action, remove "-y" from any line that ends with it and save the script.

To run the script after downloading it from the repo, assuming you are in ~/, you execute the following commands in your terminal of choice:
chmod +x scripts/personalize.sh (this gives the script permission to run)
sudo scripts/./personalize.sh (this will begin running the script)

While this script will always work for me, since my username on every system is "cas" it may not work the same for you.
For example, the script assumes that the path to save the wallpapers to is ~/wp. 
The hyprland.conf file assumes that your wallpaper is located at /home/cas/wp/magi.jpg.
If the username of the system is not "cas", you will have to manually change hyprland.conf to reflect where your wallpaper should be sourced from.
I am sure there are more instances of this, probably in rofi, but I have not came across them yet. Please inform me so they can be added to the README.md

personalize.sh mentions this, but be sure to copy&paste the contents of fedconfs/alacritty/alacritty.yml into ~/.config/alacritty/alacritty.yml
I have no idea why, but there are times when alacritty will not start if it is using the file from fedconfs/, but if you copy the text from one file to another, it works fine.
Probably a bug somewhere in my script or in how alacritty handles its config files.
Without doing this, it will be hard to get anything done in the Hyprland desktop. rofi should still work and can be used to launch Gnome Terminal or kitty,
but the system assumes alacritty as the primary terminal and attempts to open it with SUPER+ENTER. Of course, you could always opt out of alacritty for another terminal,
you would just want to document this in ~/hypr/hyprland.conf

Best of luck, and enjoy my config :) 
	-cas