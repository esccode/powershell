# powershell
powershell scripts
# skrót do szablonów na powershell ise
ctrl j
Get-Service 'name' > service.txt

Update-Help -Verbose -Force -ErrorAction SilentlyContinue
## Get-Help
Get-Help about_CommonParameters -ShowWindow
Get-Help Get-Command -Examples
Get-Help Get-Command -ShowWindow
Get-Help Get-Command -Online

## Get-Command
Get-Command pi*
Get-Command -Verb get
Get-Command -Noun Computer
Get-Command -Name *Computer*
Get-Command -Module NetTCPIP -Name *IP*

## Get-Process
Get-Process notepad
Stop-Process -id xxx -WhatIf/-Confirm

## Get-Verb
Get-Verb
Get-Verb | Select-Object group -Unique

# polecenie skrótowe
Ctrl space
delate
home
end

## Get-Alias
Get-Alias -Definition Get-ChildItem

## Get-History
history | Select-String Get



Set-Alias no notepad
New-Alias no notepad
