# Dotfiles
This repo contains my dotfile configuration<br>
Inspired by: https://github.com/xct/kali-clean

## Prerequisites
### Installing i3
#### Ubuntu
```
$ /usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2024.03.04_all.deb keyring.deb SHA256:f9bb4340b5ce0ded29b7e014ee9ce788006e9bbfe31e96c09b2118ab91fca734
$ sudo apt install ./keyring.deb
$ echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
$ sudo apt update
$ sudo apt install i3 i3blocks i3status i3-wm -y
```
#### Kali
```
$ curl https://baltocdn.com/i3-window-manager/signing.asc | sudo apt-key add -
$ sudo apt install apt-transport-https --yes
$ echo "deb https://baltocdn.com/i3-window-manager/i3/i3-autobuild/ all main" | sudo tee /etc/apt/sources.list.d/i3-autobuild.list
$ sudo apt update
$ sudo apt install i3 i3blocks i3status i3-wm -y
```
## Installation
```
$ git clone https://github.com/seriotonctf/dotfiles
```
```
$ cd dotfiles
```
```
$ chmod +x install.sh
```
Make sure you have a sudo token
```
$ sudo whoami
```
Run
```
$ ./install.sh
```
The installation script will do the following:
- Install Dependencies
- Install Nerd Fonts
- Install Alacritty
- Install i3
- Copy configs to the `~/.config` directory
- Configure tmux
- Install ohmyzsh<br>

It may take a while to setup everything
## After The Installation
- Reboot
- Select i3 (top right corner) on the login screen
- Open a terminal `windows+return`
- Run `lxappearance` 
- Select the `Ark-Dark` theme
- Change the icons to `Papirus-Dark`

## Customization
- If you want to change the wallpaper, edit the `~/.fehbg` file with the path to your wallpaper<br>
- All configurations are located in `~/.config`. Feel free to tailor them to your preferences
## Look
![Setup Screenshot](images/setup.png)