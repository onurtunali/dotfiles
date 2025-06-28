set -e 

sudo apt install gcc make neofetch git zsh curl tmux stow mpv
sudo chsh -s /bin/zsh

echo "Oh My Zsh install..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo apt update && sudo apt install extrepo -y
sudo extrepo enable librewolf
sudo apt update && sudo apt install librewolf -y
sudo apt autoremove --purge snapd
sudo apt-mark hold snapd
sudo apt install gnome-software --no-install-recommends

echo "tmux plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cho "Stow configs..."
stow --dir=./dotfiles/ --target=$HOME .

dconf load / < gnome-settings.ini
