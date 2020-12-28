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
cat .\prefix.csv -First 10
cat .\prefix.csv -Last 10

## Wyświetla serwisy, wybiera tylko uruchomione i zapisuje do pliku
Get-Service | Where-Object status -eq 'Running' | Out-File C:\Test\service.txt

## Wyświetla serwisy, wybiera tylko uruchomione i zapisuje do pliku
Get-Service | Where-Object status -eq 'Running' > C:\Test\service.txt

## Wyświetla serwisy, wybiera tylko nie uruchomione i dopisuje do pliku
Get-Service | Where-Object status -ne 'Running' >> C:\Test\service.txt

## Tworzy plik i dopisuje działające procesy
Set-Content -Path C:\Test\pliczek.txt -Value (get-process)

## Wczytuje plik
Get-Content c:\test\users.txt

## Wczytuje wszystkie pliki txt, wybiera konkretne właściwości, sortuje według wielkości i zapisuje do pliku csv
Get-ChildItem c:\Test -Filter *.txt | Select-Object Name, LastWriteTime,LastAccessTime,Length | Sort length -Descending | Export-Csv c:\Test\pliki.csv


## Wczytuje wszystkie pliki txt, wybiera konkretne właściwości, sortuje według wielkości i zapisuje do pliku csv, zastępując separator ;
Get-ChildItem c:\Test -Filter *.txt | Select-Object Name, LastWriteTime,LastAccessTime,Length | Sort length -Descending | Export-Csv c:\Test\pliki.csv -Delimiter ';'

## importuje dane 
Import-Csv C:\test\Dane.txt

## Polecenie zbierające dane z serwisów i generujace raport w formie strony html
Get-Service | ? {$_.status -eq 'Running'} | select name,status | ConvertTo-Html -Title "Service Raport" -PreContent "<h1>Zestawienie servisow z komputera $($env:COMPUTERNAME)</h1>"  | Set-
Content c:\test\raport.html

## Polecenie zbierające dane z serwisów i generujace raport w formie strony html z formatowaniem css
Get-Service | ? {$_.status -eq 'Running'} | select name,status | ConvertTo-Html -Title "Service Raport" -PreContent "<h1>Zestawienie servisow z komputera $($env:COMPUTERNAME)</h1>" -CssUri C:\test\css1.css | Set-Content c:\test\raport.html

# Zmienne
$procesy = Get-Process | select -First 5
$procesy > procesy.txt;notepad.exe .\procesy.txt

## Zwraca listę cmdletów z rzeczownikiem Variable
Get-Command -noun variable
## Tworzy nową zmienną "liczba" o wartości 123
New-Variable -Name “liczba” -value 123		
## Tworzy zmienną a i przypisuje jej wartośc 1 (gdy zmienna a istnieje przypisujej jej nową wartość)
$a=1	
## Zwraca typ danego obiektu
$a.getType()				
## Tworzy zmienną name i przypisujej jej typ liczb całkowitych
[int32]$name							
## Czyści wartość zmiennej MyVariable
Clear-Variable -name MyVariable		
## Czyści wartość zmiennej MyVariable
$MyVariable = $null						
## Usuwa zmienną MyVariable
remove-variable -name MyVariable		
## Wyświetla wszystkie zmienne
Get-Variables						
## Ustawia atrybut danej zmiennej na ReadOnly (tylko do odczytu)
Set-Variable nazwa_zmiennej –Option readonly			 

