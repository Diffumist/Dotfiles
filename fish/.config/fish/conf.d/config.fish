export LANG="en_US.UTF-8"
set -g fish_greeting
# >>> alias and abbr
if type -q nali
  function myip
    curl -L -s ipconfig.me | nali
  end
end
if type -q exa
  abbr -a ls exa -al --icons
end
if type -q duf
  abbr -a df duf
end
if type -q bat
  abbr -a cat bat
end
if type -q podman
  abbr -a docker podman
end
if type -q exa
  abbr -a tree exa -T
end

if [ -f $HOME/.config/fish/alias.fish ]
  source $HOME/.config/fish/alias.fish
end

# >>> su
function su
  /bin/su --shell=/usr/bin/fish $argv
end
# >>> Proxy
function myproxy
  export ALL_PROXY = socks5://127.0.0.1:7890
  export all_proxy = socks5://127.0.0.1:7890
end
source $HOME/.profile
zoxide init fish | source
starship init fish | source