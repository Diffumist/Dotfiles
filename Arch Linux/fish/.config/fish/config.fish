export LANG="en_US.UTF-8"
set -g fish_greeting
# >>> Alias
if type -q nali
  function myip
    curl -L -s ipconfig.me | nali
  end
end
if type -q exa
  abbr -a ls exa -al --icons
end
abbr -a rm rm -i
if type -q bat
  abbr -a cat bat
end
if type -q podman
  abbr -a docker podman
end
if type -q exa
  abbr -a tree exa -T
end
if type -q ytop
  abbr -a htop ytop
end
zoxide init fish | source
# >>> su
function su
    /bin/su --shell=/usr/bin/fish $argv
end
# >>> Proxy
function myproxy
    export ALL_PROXY = socks5://127.0.0.1:7890
    export all_proxy = socks5://127.0.0.1:7890
end
# >>> PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH=/bin:/usr/bin:/usr/local/bin:{$PATH}
export PROMPT_EOL_MARK=""
export RUST_BACKTRACE=1
export PATH="$HOME/.cargo/bin/:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

starship init fish | source
