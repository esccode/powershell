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
Set-Alias no notepad
New-Alias no notepad

## Get-History
history | Select-String Get
Get-History | Format-List -Property *

## Potoki
zbieranie | sortowanie | wyswietlanie
Get-Service | Sort-Object Status | Format-Table Name, Status
1,2,3 | ForEach-Object {$PSItem}
1,2,3 | ForEach-Object {$_}


# pliki

Get-Location
Get-Service | where status -eq 'running' | Out-File C:\Users\jacek\OneDrive\Desktop\service-running.csv
Get-Service | where status -eq 'stopped' > C:\Users\jacek\OneDrive\Desktop\service-stopped.csv
Get-ChildItem c:\Test -Filter *.txt | Select-Object Name, LastWriteTime,LastAccessTime,Length | Sort length -Descending | Export-Csv c:\Test\pliki.csv -Delimiter ';'
Import-Csv .\service.csv
(Import-Csv .\cennik-netia.csv).Prefix
