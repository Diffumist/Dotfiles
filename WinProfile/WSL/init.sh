#!/bin/sh

function _install_packages() {
    if [[ "$DISTRO" == "ubuntu" ]]
    then
    sudo apt update && sudo apt -y install $(cat pkglist/ubuntu.pkglist)
    echo "Unsupported distribution."
    fi
}
function _install_zplug() {
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
}
_install_zplug()
_install_packages()