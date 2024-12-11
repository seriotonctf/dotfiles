#!/bin/bash

set -e

# Installing dependencies
echo -e '\e[38;5;75m[+] Updating the system and installing dependencies...\e[0m'

sudo apt update
sudo apt install -y wget curl git thunar zsh tmux picom rofi polybar neofetch feh flameshot lxappearance cargo imagemagick fzf arc-theme papirus-icon-theme

# Installing Fonts
echo -e '\e[38;5;75m[+] Installing fonts...\e[0m'

mkdir -p ~/.local/share/fonts/

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Iosevka.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/RobotoMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/MartianMono.zip

unzip -o Iosevka.zip -d ~/.local/share/fonts/
unzip -o RobotoMono.zip -d ~/.local/share/fonts/
unzip -o JetBrainsMono.zip -d ~/.local/share/fonts/
unzip -o MartianMono.zip -d ~/.local/share/fonts/

fc-cache -fv

# Installing alacritty
echo -e '\e[38;5;75m[+] Installing Alacritty...\e[0m'

sudo apt install cmake g++ pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

cd ../

# Copying configs
echo -e '\e[38;5;75m[+] Copying configs...\e[0m'

mkdir -p ~/.config/i3
cp .config/i3/clipboard_fix.sh ~/.config/i3/clipboard_fix.sh
cp .config/i3/config ~/.config/i3/config
chmod +x ~/.config/i3/clipboard_fix.sh

mkdir -p ~/.config/picom
cp .config/picom/picom.conf ~/.config/picom/picom.conf

cp -r .config/rofi ~/.config/
chmod +x ~/.config/rofi/launchers/type-1/launcher.sh

mkdir -p ~/.config/alacritty
cp .config/alacritty/*.toml ~/.config/alacritty/

mkdir -p ~/.config/polybar
mkdir -p ~/.config/polybar/scripts
cp .config/polybar/config.ini ~/.config/polybar/config.ini
cp .config/polybar/launch_polybar.sh ~/.config/polybar/launch_polybar.sh
cp .config/polybar/scripts/tun0_ip.sh ~/.config/polybar/scripts/tun0_ip.sh
chmod +x ~/.config/polybar/launch_polybar.sh
chmod +x ~/.config/polybar/scripts/tun0_ip.sh

mkdir -p ~/.config/neofetch
cp .config/neofetch/config.conf ~/.config/neofetch/config.conf

cp .fehbg ~/.fehbg
cp -r .wallpaper ~/.wallpaper

# Configuring tmux
echo -e '\e[38;5;75m[+] Configuring tmux...'

cp .config/.tmux.conf ~/.tmux.conf 

echo -e '\e[38;5;75m[+] Done! Enjoy your i3 setup :)\e[0m'

# Installing ohmyzsh
echo -e '\e[38;5;75m[+] Installing ohmyzsh...\e[0m'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"