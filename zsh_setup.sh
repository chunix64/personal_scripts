#!/bin/sh

# Install Zsh and Oh My Zsh
apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Clone new theme and plugins
git clone https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Update .zshrc plugins
ZSHRC="$HOME/.zshrc"
NEW_PLUGINS="plugins=(git zsh-syntax-highlighting zsh-autosuggestions)"

if grep -q "^plugins=" "$ZSHRC"; then
    # Replace existing plugins line
    sed -i "s/^plugins=.*/$NEW_PLUGINS/" "$ZSHRC"
else
    # Add plugins line if not exist
    echo "$NEW_PLUGINS" >> "$ZSHRC"
fi

# Optional: set theme to powerlevel10k
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$ZSHRC"

echo "Zsh plugins updated. Please restart your terminal or run 'source ~/.zshrc'."

