# zmodload zsh/zprof
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export LANG="en_US.UTF-8"

# >>> Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# >>> Load

# zinit wait lucid for \
#     OMZ::lib/clipboard.zsh \

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions
    
zinit wait lucid for \
    OMZ::lib/git.zsh \
    OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh \
    OMZ::plugins/systemd/systemd.plugin.zsh \
    OMZ::plugins/sudo/sudo.plugin.zsh \
    OMZ::lib/key-bindings.zsh \
    OMZ::lib/history.zsh \
    OMZ::plugins/git/git.plugin.zsh \


zinit as="completion" for \
    OMZ::plugins/rust/_rust \
    OMZ::plugins/fd/_fd
    
zinit wait'!0' lucid for \
    Aloxaf/fzf-tab \
    romkatv/zsh-defer
    
zinit wait'!1' lucid for \
    laggardkernel/zsh-thefuck \
    lukechilds/zsh-better-npm-completion \
    sobolevn/wakatime-zsh-plugin \

# >> completions 

zinit ice as"completion" 
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/docker-compose/_docker-compose
zinit ice as"completion" 
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/docker/_docker 
zinit ice as"completion" 
zinit snippet ~/.zfunc/_volta 
zinit ice as"completion" 
zinit snippet ~/.zfunc/_rustup 
zinit ice as"completion" 
zinit snippet ~/.zfunc/_cargo 
zinit ice as"completion" 
zinit snippet https://github.com/zchee/zsh-completions/blob/master/src/zsh/_aria2c 
zinit ice as"completion" 
zinit snippet https://github.com/esc/conda-zsh-completion/blob/master/_conda 
zinit ice as"completion" 
zinit snippet /usr/share/fzf/completion.zsh

# >>> Themes

: ${THEME:=p10k}

case $THEME in
    pure)
        PROMPT=$'\n%F{cyan}❯ %f'
        RPROMPT=""
        zstyle ':prompt:pure:prompt:success' color cyan
        zinit ice lucid wait="!0" pick="async.zsh" src="pure.zsh" atload="prompt_pure_precmd"
        zinit light Aloxaf/pure
        ;;
    p10k)
        source ~/.p10k.zsh
        zinit ice depth=1
        zinit light romkatv/powerlevel10k
        ;;
esac

# >>> https://github.com/ohmyzsh/ohmyzsh/issues/8751
# _systemctl_unit_state() {
#   typeset -gA _sys_unit_state
#   _sys_unit_state=( $(__systemctl list-unit-files "$PREFIX*" | awk '{print $1, $2}') )
# }
# >>> Other
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

ZSH_AUTOSUGGEST_MANUAL_REBIND=1 

# >>> End of Zinit

# >>> ZSH-defer
source ~/.zinit/plugins/romkatv---zsh-defer/zsh-defer.plugin.zsh
zsh-defer source ~/.zsh_conda

# 补全 `kill` 命令时提供命令行参数预览
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap

# 补全 cd 时使用 exa 预览其中的内容
zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'exa -1 --color=always $realpath'

#  FZF
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || bat{} || cat {}) 2> /dev/null | head -500'"


# >>> proxy
proxy(){
    export ALL_PROXY=socks5://127.0.0.1:7890
    export all_proxy=socks5://127.0.0.1:7890
}
proxy
myip(){
    curl -L -s ipconfig.me|nali
}

#alias
alias ls='exa'
#alias rm='rm -i'
alias cat='bat'
alias tree='exa -T'
alias ps='procs'
alias vim='nvim'
# ZSH_nomatch
setopt no_nomatch

# >>> PATH
# /bin:/usr/bin:/usr/local/bin:
export PATH="$HOME/.local/bin:$PATH"
export PATH=/bin:/usr/bin:/usr/local/bin:${PATH}
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PROMPT_EOL_MARK=""
export RUST_BACKTRACE=1
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# (( ! ${+functions[p10k]} )) || p10k finalize
# zprof

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# added by travis gem
[ ! -s /home/diffumist/.travis/travis.sh ] || source /home/diffumist/.travis/travis.sh
