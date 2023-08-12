#!/bin/bash

# The following lines install the packages needed to run QEMU/KVM and virt-manager on your system. They are all commented by default.
# Find the line that begins with your package manager (dnf, apt, or pacman) and remove the '#' before that line.
# qemukvminstall.sh MUST be run with sudo

# dnf install libvirt qemu virt-manager -y
# pacman -S libvirt qemu virt-manager -y
# apt install libvirt qemu virt-manager -y

# The next section adds your user to the "libvirt" group, which will allow you to add and run virtual machines in virt-manager.

usermod -aG libvirt $USER

# Finally, the script removes itself and all othr scripts from the "Scripts" folder downloaded from https://github.com/bvanover/scripts.
# If you would like to keep more of these scripts to experiment with, simply add a '#' before the following command.

rm -r ~/scripts