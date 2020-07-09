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

function PrettyLS {
  colorls --light -A
}

function GitStat { git status }

function GoBack { Set-Location .. }

function GetMyIp { curl -L tool.lu/ip }
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
Set-Alias pls PrettyLS
Set-Alias suu UpdateScoop
# Set theme
Set-Theme Paradox
Set-Culture en-US

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# SIG # Begin signature block
# MIIFpwYJKoZIhvcNAQcCoIIFmDCCBZQCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUeLADDwInpHhFyrA09qeRPBWQ
# 2megggM5MIIDNTCCAiGgAwIBAgIQsMWWmUPDRIxO40WEZmkCMjAJBgUrDgMCHQUA
# MCMxITAfBgNVBAMTGE1vc3NlclBvd2VyU2hlbGxUZXN0Q2VydDAeFw0yMDA1MjUx
# MzE4MzlaFw0zOTEyMzEyMzU5NTlaMCMxITAfBgNVBAMTGE1vc3NlclBvd2VyU2hl
# bGxUZXN0Q2VydDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMquVzur
# iNrrNYdNgrlZ3kbZcGSZ/uaBGJmPoB72/4e3GDSR+Pdr5YQp6rnnYhRP7B2PVl3t
# iFL4gqeby8EEMq1FLEiPYaXeLxWO85yfAiN4sNgiI3IhVZdkMBnV+H1h5MSGA7zF
# G1JZKn8pZ9ZmCHtZMjQjqghFOx8CJ6TxApo/bgwZu3xK7vj18FiOEljijcnLMeVK
# +3o+ZZY0HKrDidZ4q74H/rF9gSRn/QFUDi8KUg43ifQLgt6L9OZvQ6/ofTUoEjx5
# ADstXaxCLfQw4jaDVFtx5QVk6JT9Do1W4VQEVCCncyq/vgIZ3QqZMUT++FGVl9z1
# 4+mVTJwRxEDMLKECAwEAAaNtMGswEwYDVR0lBAwwCgYIKwYBBQUHAwMwVAYDVR0B
# BE0wS4AQ9DNeBxK71HvQPW5n1S0+1aElMCMxITAfBgNVBAMTGE1vc3NlclBvd2Vy
# U2hlbGxUZXN0Q2VydIIQsMWWmUPDRIxO40WEZmkCMjAJBgUrDgMCHQUAA4IBAQBf
# D7wE5oKOsegB+XkgDcDIKry5bN45By8Rd9qLbNzn9Oz0teSOxaDi/ul+Dna7cfRB
# /Hw7DLcIkNFVplEqDjIq8+yJGO2dzJ1KljFlzunQ3UDFkR4h9ibDRXWJ/qbjlkSJ
# uojZeGmJtRa8EV4BZMqUEx3sPTRSoauwUG7olW3P4W6+F91fa0Vm/9yWNUwsJbGk
# O3t3X2eyB4ZozbWOYiJRK97/IQPo5Cz2nsg/lTtXiLTFM79PPfuUflVXfclSRasT
# YEBpN6TQwmlrIAWV+cZeVrx5y5AaE1KblsTY4SIB2y7eot3HvV4dugXGBuajxvW1
# 0DAi93R0kao4VqznxwbJMYIB2DCCAdQCAQEwNzAjMSEwHwYDVQQDExhNb3NzZXJQ
# b3dlclNoZWxsVGVzdENlcnQCELDFlplDw0SMTuNFhGZpAjIwCQYFKw4DAhoFAKB4
# MBgGCisGAQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJKoZIhvcNAQkDMQwGCisGAQQB
# gjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkE
# MRYEFOTKThyDZJ4FFktVx/V3vrTYkISyMA0GCSqGSIb3DQEBAQUABIIBAELbZaHe
# o9OCg4jHYXkJAkTeKsviox2K/Nr0nHGQZ6Qik3JABZgrLTL9brt+i/7c0xcgI+w1
# IPRiZN+iBkdb8M6qG4Vt4AFpoSEwp6O6R3zSQfZVLyo83RfMAoIMfWqwpAdi1uAy
# cNHzW/ygRTjY/h20skYWOQW2zZR87AhUwFtVm/8sIe8dmcnkHRDx1xqX5i+ve8Uw
# sRncp0iKK3o5+kZgcU48LhDoopVzJ4mjO0IY9mIBMNCUiBOCNZbTaYNXw389fP5H
# IYzMWTH1xdP5MXPWfZpEPeKGE3K9mYfIHy3GyR+n/RCycUn+LgPuGoyv6bI+THQR
# xD4k1+1eUKdO3oM=
# SIG # End signature block
