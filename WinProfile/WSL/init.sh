#!/bin/sh

function _install_packages() {
    if [[ "$DISTRO" == "ubuntu" ]]
    then
    sudo apt update && sudo apt -y install $(cat pkglist/ubuntu.pkglist)
    echo "Unsupported distribution."
    fi
}
function _install_ohmyzsh() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
}
_install_ohmyzsh()
_install_packages()