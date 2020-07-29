# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ ! -d ~/.zplug ]]; then
  echo "please install zplug or run `curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh`"
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANG="en_US.UTF-8"
source ~/.zinit/bin/zinit.zsh

# source ~/.zplug/init.zsh
# export ZPLUG_HOME=/usr/share/zsh/scripts/zplug/
# source $ZPLUG_HOME/init.zsh
# sudo chmod +x /usr/share/zsh/scripts/zplug/init.zsh
source /usr/share/zsh/scripts/zplug/init.zsh

# History config
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$ZPLUG_HOME/zsh_history
setopt append_history
setopt share_history
setopt long_list_jobs
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt hist_no_store
setopt interactivecomments
zstyle ':completion:*' rehash true

# Key binds
bindkey '\eOA'    history-substring-search-up
bindkey '\eOB'    history-substring-search-down
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

# Make sure to use double quotes
zplug "plugins/git",   from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/man", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/encode64", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "stedolan/jq", \
    from:gh-r, \
    as:command, \
    rename-to:jq
zplug "b4b4r07/emoji-cli", \
    on:"stedolan/jq"
zplug "felixr/docker-zsh-completion", defer:2
zplug "esc/conda-zsh-completion", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "rimraf/k"
zplug "sobolevn/wakatime-zsh-plugin"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "romkatv/powerlevel10k", as:theme, depth:1
# Can manage local plugins
zplug "~/.zsh", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load


eval $(thefuck --alias FUCK)
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$CONDA_PATH/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$CONDA_PATH/etc/profile.d/conda.sh" ]; then
        . "$CONDA_PATH/etc/profile.d/conda.sh"
    else
        export PATH="$CONDA_PATH/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> PATH
# /bin:/usr/bin:/usr/local/bin:
PATH=~/.local/bin:${PATH}
export PATH="$PATH:/mnt/c/WINDOWS:/mnt/c/WINDOWS/system32"
export PATH="$PATH:/mnt/c/Users/Spencer/AppData/Local/Programs/Microsoft VS Code/bin"
# >>> Proxy
if [ ! -f "$gitconfig" ]; then
    touch "$gitconfig"
fi
if [ ! -f "$curlrc" ]; then
    touch "$curlrc"
fi

wslnet1(){
    sed -i '/\[http]/,$d' ~/.gitconfig
    echo -e '[http]\nproxy=socks5://127.0.0.1:7890\n[https]\nproxy=socks5://127.0.0.1:7890' >> ~/.gitconfig
    sed -i '/socks5.*/d' ~/.curlrc
    echo 'socks5=127.0.0.1:7890' >> ~/.curlrc
    export ALL_PROXY=socks5://127.0.0.1:7890
    export all_proxy=socks5://127.0.0.1:7890
}

wslnet2(){
    export WIN_IP=`cat /etc/resolv.conf | grep nameserver | awk '{print $2}'`
    sed -i '/\[http]/,$d' ~/.gitconfig
    echo -e '[http]\nproxy=socks5://'${WIN_IP}':7890\n[https]\nproxy=socks5://'${WIN_IP}':7890' >> ~/.gitconfig
    sed -i '/socks5.*/d' ~/.curlrc
    echo 'socks5='${WIN_IP}':7890' >> ~/.curlrc
    export ALL_PROXY=socks5://'${WIN_IP}':7890
    export all_proxy=socks5://'${WIN_IP}':7890
}
wslnet2

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
