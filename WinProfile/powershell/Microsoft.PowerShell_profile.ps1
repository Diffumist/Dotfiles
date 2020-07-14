Import-Module Get-ChildItemColor

$env:PYTHONIOENCODING="utf-8"
# Remove curl alias
If (Test-Path Alias:curl) {Remove-Item Alias:curl}
If (Test-Path Alias:curl) {Remove-Item Alias:curl}
# Remove-Item alias:ls -force
Set-Alias l Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope

function GitLogPretty {
  git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all
}

function GitStat { git status }

function GoBack { Set-Location .. }

function GetMyIp { curl -L -s ifconfig.me | nali }
function UpdateScoop { scoop update; scoop update * }

Import-Module posh-git
Import-Module oh-my-posh
# $DefaultUser = 'spenc'

# Setup other alias
Set-Alias open Invoke-Item
Set-Alias .. GoBack
Set-Alias glola GitLogPretty
Set-Alias gst GitStat
Set-Alias myip GetMyIp
Set-Alias scu UpdateScoop
# Set theme
Set-Theme Paradox
Set-Culture en-US

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
