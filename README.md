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

# Tablice
## Tworzy nową tablicę
$dane = @()	
## Tworzy nową tablicę i przypisuje elementy
$dane = @('Jeden','Dwa','Trzy','Cztery')	
## Tworzy nową tablicę i przypisuje elementy w kilku wierszach (przydatne w skryptach)
$dane = @('Jeden'		
    'Dwa'
		'Trzy'	
		'Cztery')
## Tworzy nową tablicę i przypisuje elementy
$dane = ‘Jeden’,‘Dwa’,‘Trzy’,‘Cztery’		
## Tworzy nową tablicę i przypisuje elementy
$dane = Write-Output Jeden Dwa Trzy Cztery				
## Tworzy nową tablicę i przypisuje elementy od 1 do 10
$liczby=1..10						
## Zwraca typ danego obiektu (w tym przypadku tablicy)
$dane.getType()			
## Tworzy nową tablicę tylko dla elemnetów liczbowych (liczby całkowite)
[int32[]]$liczby		
## Zwraca typ danego obiektu (w tym przypadku tablicy)
$liczby.getType()		
## Wyświetla dany obiekt (w tym przypadku elementy tablicy)
$liczby		
## Wyświetla element tablicy o indeksie 0
$liczby[0]							
## Różne wariacje wyświetlania elmentów
$liczby[0,2,3],$data[3,0,3],$data[1..3],$data[-1]			
## Zwraca liczbę elementów tablicy
$liczby.count						
## Dodaje element do tablicy (jeżeli tablica jest odpowiedniego typu)
$liczby.add(‘11’)			
## Usuwa element tablicy (jeżeli tablica jest odpowiedniego typu)
$liczby.Remove('1')  					
## Tworzy tablicę typy ArrayList, do któej można dodawać i usuwać elementy
[System.Collections.ArrayList]$liczby_zmienna=1..10		

# Tablice skrotow

## Deklaracja tablicy skrótów
$wiek = @{}
## Deklaracja tablicy skrótów z elementami
$w iek=@{Adam=30;Zosia=25}
## Deklaracja tablicy skrótów z elementami w wielu wierszach
$wiek=@{								
Adam=30
Zosia=25
Tomek=34}
## Dodanie pary danych do tablicy
$wiek.add(‘Ola’,50)	
## Dodanie pary danych do tablicy (ze zmiennych)
$imie=Alek; $w=10; $wiek.add($imie,$wiek)
## Dodanie pary danych do tablicy
$wiek[Natalia]=28	
## Dodanie pary danych do tablicy
$wiek=$wiek+@{Magda=23}							
## Wyświetlenie konkretej wartości dla klucza Ola
$wiek[‘Ola’]	
## Wyświetlenie konkretej wartości dla klucza Ola i Adam
$wiek[‘Ola’,’Adam’]
## Wyświetlenie konkretej wartości dla klucza Ola
$wiek.Ola
## Wyświetlenie wszystkich kluczy
$wiek.keys
## Wyświetlenie wszystkich wartości
$wiek.values
## Zliczenie wszystkich par elementów
$wiek.count
## Sortowanie tablicy według kluczy
$hash.GetEnumerator() | Sort-Object -Property key
## Deklaracja uporządkowanej tablicy z elementami
$wiek_ordered=[ordered]@{Adam=30;Zosia=25;Tomek=34}
## Usuwanie elemetnu z kluczem Adam
$wiek.remove(„Adam”)							
## Zwraca 10 pierwszych serwisów
Get-Service | select -first 10						
## Zwraca 10 pierwszych serwisów posortowanych według statusu
Get-Service | sort status -descending | select -first 10		
## Zwraca 10 pierwszych serwisów posortowanych według statusu (malejąco) oraz nazwy (rosnąco)
Get-Service | Sort-Object -Property @{Expression = "Status"; Descending = $True}, @{Expression = "DisplayName"; Descending = $False} | select -first 10

# Sort-Object
## Zwraca elementy z katalogu C:\Test
Get-ChildItem -Path C:\Test
## Zwraca pliki z katalogu C:\Test i sortuje je według domyślnych ustawień
Get-ChildItem -Path C:\Test | Sort-Object	

## Zwraca pliki z katalogu C:\Test i sortuje je malejąco
Get-ChildItem -Path C:\Test -File | Sort-Object -Descending
## Zwraca pliki z katalogu C:\Test i sportuje je według właściwości - wielkość (długość)
Get-ChildItem -Path C:\Test -File | Sort-Object -Property Length		
## Zwraca pliki z katalogu C:\Test i sportuje je według właściwości - ostatni czas zapisu
Get-ChildItem -Path C:\Test -File | Sort-Object -Property LastWriteTime -Descending	
## Wyświetla zawartość pliku
Get-Content -Path C:\Test\Users.txt	
## Wyświetla zawartość pliku i sortuje zawartośc według domyślnych ustawień
Get-Content -Path C:\Test\Users.txt | Sort-Object			
## Wyświetla zawartość pliku i sortuje zawartośc według unikalności danych
Get-Content -Path C:\Test\Users.txt | Sort-Object -Unique	
## Wyświetla zawartość pliku i sortuje zawartośc według właściwości - wielkość (długość)
Get-Content -Path C:\Test\Users.txt | Sort-Object -Property Length		
## Wyświetla zawartość pliku
Get-Content -Path C:\Test\Liczby.txt
## Wyświetla zawartość pliku i sortuje zawartość według domyślnych ustawień 
Get-Content -Path C:\Test\Liczby.txt | Sort-Object						
## Wyświetla zawartość pliku i sortuje zawartość według domyślnych ustawień (obikety w potoku jako liczby całkowite)
Get-Content -Path C:\Test\Liczby.txt | Sort-Object {[int]$_}					

# Select-Object

## 10 procesów wykorzystujacych najwiecej pamięci
Get-Process | sort -Property WS -Descending | select -First 10
## 10 procesów wykorzystujacych najwiecej procesora CPU
Get-Process | sort -Property CPU -Descending | select -First 10

## Wyświetla zawartość katalogu C:\Test, w tym tylko Nazwę obiektów
Get-ChildItem -Path C:\test | Select-Object -Property Name	
## Wyświetla zawartość katalogu C:\Test, w tym tylko Nazwę i ostatni czas dostępu obiektów
Get-ChildItem -Path C:\test | Select-Object -Property Name, LastAccessTime		
## Wyświetla wszystkie właściwości danego pliku
Get-ChildItem -Path C:\test\users.txt | Select-Object -Property *	
## Wyświetla wszystkie właściwości danego pliku z wykluczeniem VersionInfo
Get-ChildItem -Path C:\test\users.txt | Select-Object -Property * -ExcludeProperty VersionInfo	
## Wyświetla procesy, sortuje według zajętości pamięci malejąco i wybiera 10 pierwszych
Get-Process | Sort-Object -Property WS -Descending | Select-Object -First 10		
## Wyświetla procesy, sortuje według zajętości pamięci malejąco i wybiera 10 ostatnich
Get-Process | Sort-Object -Property WS -Descending | Select-Object -Last 10	
## Wyswietla zawartość pliku
Get-Content -Path C:\test\Litery.txt	
## Wyswietla zawartość pliku i wybiera tylko obikety unikalne
Get-Content -Path C:\test\Litery.txt | Select-Object -Unique	
## Wyswietla zawartość pliku i wybiera tylko ten z indexem 1
Get-Content -Path C:\Test\Users.txt | Select-Object -Index 1
## Wyswietla zawartość pliku i pomija 5 pierwszych obiektów
Get-Content -Path C:\Test\Users.txt | Select-Object -Skip 5					
