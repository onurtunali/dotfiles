#!/usr/bin/env bash

set -e 

sudo apt update -y

sudo apt install gcc make neofetch git zsh curl tmux stow mpv
sudo chsh -s /bin/zsh

echo "Oh My Zsh install..."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Librewolf install..."

sudo apt update && sudo apt install extrepo -y
sudo extrepo enable librewolf
sudo apt update && sudo apt install librewolf -y

echo "Purge snapd..."

sudo apt autoremove --purge snapd
sudo apt-mark hold snapd
sudo apt install gnome-software --no-install-recommends

echo "Tmux plugins..."

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Docker install..."

sudo apt-get -y install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
sudo groupadd docker
sudo usermod -aG docker $USER

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -y update

## Install
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo "Requires log out for preventing docker permission errors..."

cho "Stow configs..."
stow --dir=./dotfiles/ --target=$HOME .

dconf load / < gnome-settings.ini
