#!/usr/bin/env bash

# dependencies
sudo zypper install -t pattern devel_basis 
sudo zypper install libX11-6 libX11-devel libXft2 libXft-devel libXinerama1 libXinerama-devel freetype2 freetype2-devel fontconfig fontconfig-devel imlib2 imlib2-devel libxcb1 libxcb-devel libxcb-util1 xcb-util-devel xcb-util-image-devel xcb-util-keysyms-devel xcb-util-renderutil-devel xcb-util-wm-devel xorg-x11-server xorg-x11 xorg-x11-fonts xorg-x11-essentials

# additional packages needed
sudo zypper install feh arandr bat btop catfish curl dconf-editor duf fastfetch file-roller flameshot galculator hardinfo2 hw-probe lxappearance meld most nitrogen numlockx pavucontrol python313 python313-pylint ripgrep xfce4-terminal ghostty wezterm kitty alacritty thunar thunar-archive-plugin thunar-shares-plugin thunar-volman tumbler neovim xed dash rofi sxhkd xrandr NetworkManager-applet xprop xsetroot fd eza acpi picom cmake terminus-bitmap-fonts nfs-utils consoleet-terminus-fonts
