set -e 

echo "Oh My Zsh install..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "tmux plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

brew bundle install

echo "Stow configs..."
stow --dir=./dotfiles/ --target=$HOME .