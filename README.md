# powershell
powershell scripts

## Get-ExecutionPolicy
Get-ExecutionPolicy -List
Unblock-File -Path .\Instrukcja-switch2.ps1

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

# Where-Object
## Wyświetla tylko obikety spełniające dany warunek
1..10 | Where-Object {$_ -gt 5}	
## Wyświetla uruchomione serwisy
Get-Service | ? {$_.status -eq 'Running'}			
## Wyświetla uruchomione serwisy z nazwą na literę w
Get-Service | ? {$_.status -eq 'Running' -and $_.name -like 'w*'}		
## Wyświetla uruchomione serwisy
Get-Service | ? status -eq ‘Running’	
## Zwraca liste uzytkownikow spelniajacych warunek
Get-LocalUser | ? name -like 'j*'

# Format
## Zwraca dane o konkretnym procesie
Get-Process -Name notepad						
## Zwraca dane o konkretnym procesie w formie tabeli
Get-Process -name notepad | Format-Table				
## Zwraca dane o konkretnym procesie w formie tabeli wyświetla tylko nazwę i identyfikator procesu
Get-Process -name notepad | ft -Property Name, ID
## Zwraca dane o konkretnym katalogu w tabeli z parametrem AutoSize (domyślne dopasowanie)
Get-Item -Path c:\tmp | Format-Table -AutoSize				
## Zwraca dane o procesach na literę W w formie tabeli z widokiem pogrupowanym ze względu na ważność
Get-Process -Name w* | Format-Table -View Priority			
## Zwraca dane o konkretnym procesie w formie listy
Get-Process -name notepad | Format-List					
## Zwraca dane o konkretnym procesie w formie listy, wyświetlając wszystkie właściwości
Get-Process -Name notepad | Format-List -Property *			
## Wyświetla wszystkie procesy w formie szerokiej tabeli
Get-Process | Format-Wide						
## Wyświetla elementy z danego katalogu w formie szerokiej tabeli z parametrem AutoSize
Get-ChildItem | Fw -Property name –AutoSize				 
## Wyświetla elementy z danego katalogu w formie szerokiej tabeli z 8 kolumnami
Get-ChildItem | Format-Wide -Property name -Column 8			
## Zwraca dane o konkretnym procesie w formie domyślnego widoku
Get-Process -name notepad | Format-Custom				
## Zwraca dane o konkretnym pliku w formacie domyślnego widoku
Get-Item C:\Test\DDACLSys.log | Fc					
## Zwraca dane o konkretnym pliku w formacie domyślnego widoku z ustawionym poziomem szczegółowości
Get-Item C:\Test\DDACLSys.log | Fc -Depth 1				
## Wyświeta procesy następnie sortuje je według producenta i zlicza
Get-Process | group Company | Sort-Object Count -Descending		

# Measure-Object

cat D:\data\household_power_consumption.txt | Measure-Object -Line -Word -Character

## Zlicza serwisy na komputerze
Get-Service | Measure-Object								
## Zlicza procesy na koputerze
(Get-Process).count									
## Zwraca wartość Min, Max i sumę virtualnej pamięci wykorzystywanej przez procesy na komputerze
Get-Process | Measure-Object -Property VirtualMemorySize -Minimum -Maximum -Sum		
## Wyświetla zawartośc pliku
Get-Content C:\Test\Users.txt								
## Zlicza znaki, wiersze oraz słowa w pliku tekstowym
Get-Content C:\Test\Users.txt | Measure-Object -Character -Line -Word	

# Out-GridView
Get-Process | select -Property * | Out-GridView
cat D:\data\P00000001-ALL.csv | Out-GridView

## Wyświetla procesy w oknie Out-Gridview
Get-Process | Out-GridView	
## Wyświetla serwisy w oknie Out-Gridview
Get-Service | Out-GridView				

# Instrukcja-If

<#
if (<wyrażenie warunkowe 1>)
{<lista instrukcji 1>}
[elseif (<wyrażenie warunkowe 2>)
{<lista instrukcji 2>}]
[else
{<lista instrukcji 3>}]
#>

$a = Read-Host 'Proszę podaj liczbę'
if($a -gt 4) {Write-Host "Liczba $a jest większa od 4"}
elseif($a -eq 4) {Write-Host "Liczba $a jest równa 4"} 
else {Write-Host "Liczba $a jest mniejsza od 4"}



$plik = Read-Host ‘Podaj ścieżkę’
if (Test-Path $plik) 
{ Get-Content $plik}
else
{Write-Host "Plik nieistnieje"}

# Instrukcja Switch

<#
Switch (<wartość testowa>)
{
<warunek> {<lista instrukcji 1>}
<warunek> {<lista instrukcji 2>}
<warunek> {<lista instrukcji 3>}
Default {<lista instrukcji 4>}
} 
#>

$a=Read-Host 'Podaj liczbę'
#a=(2,4,7)
Switch($a)
{
1 {'Wpisano jeden'}
2 {'Wpisano dwa'}
3 {'Wpisano trzy'}
1 {'Występuję ponownie'}
4 {'Wpisano cztery'}
Default {'Wpisano liczbę inną niż jeden, dwa, trzy i cztery'}
}


function Moje_Menu
{
    param (
        [string]$Title = 'PRZYKŁAD MENU'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host "1: Pokaż użytkowników."
    Write-Host "2: Pokaż dziennik zdarzeń."
    Write-Host "3: Archiwizuj dziennik zdarzeń."
    Write-Host "Q: Wyjście."
    Write-Host "==============================================="
}

do
 {
     Moje_Menu
     $selection = Read-Host "Twój wybór"
     switch ($selection)
     {
         '1' { 'Wybrano 1... Przygotowanie listy uzytkowników....'} 
         '2' { 'Wybrano 2... Przygotowanie dziennika zdarzeń...'  } 
         '3' { 'Wybrano 3... Archiwizacja dziennika zdarzeń...'   }
         'q' { 'Wybrano q... Nastąpi wyjście z programu...'   }
         Default {'Błąd... Proszę wybrać jeszcze raz...'}
     }
     pause
 }
 until ($selection -eq 'q')

# Pętla do until/while

<#
     do {<lista poleceń>} until (<warunek>) 
#>

$i=0
$tab=1..5
do {
$tab[$i]++
$tab[$i]
$i++}
until($i -eq 5)

<#
     do {<lista poleceń>} while (<warunek>) 
#>

$i=0
$tab=1..5
do {
$tab[$i]++
$tab[$i]
$i++}
while($i -lt 5)

$i = 0 
$ip_addr = ('wp.pl','onet.pl','google.pl','facebook.pl')
do { 
Test-NetConnection $ip_addr[$i] 
$i++ 
} while ($i -lt 4)

<#
      while (<warunek>) {<lista poleceń>}
#>

$a=0
While($a -lt 5) {
$a
$a++
}

$pass_length=9
$pass_l=0
while($pass_l -lt $pass_length) {
$pass = Read-Host 'Podaj swoje hasło' -AsSecureString
$pass_l=$pass.Length
} 
 'Hasło zaakceptowane'
 
 # Pętla for
 
 <#
for (<Zmienna inicjująca>; <Warunek>; <Przyrost>)
{
    <Polecenia>
}
#>

$a=0
for($a=23164;$a -lt 23185;$a++)
{
$a
}


for($a=1;$a -le 255;$a++)
{
Test-NetConnection -ComputerName 192.168.0.$a 
}

# Pętla forEach

<#
        ForEach-Object {$_ blok poleceń }
#>

$ip_addr = ('wp.pl','onet.pl','google.pl','facebook.pl')
$ip_addr | foreach {Test-NetConnection -ComputerName $_}


<#
foreach (<zmienna iteracyjna> in <tablica>) { blok poleceń }
#>

$ip_addr = ('wp.pl','onet.pl','google.pl','facebook.pl')
foreach ($i in $ip_addr)
{
Test-NetConnection -ComputerName $i
}


<#
    <tablica>.foreach({<blok poleceń>})
#>

$ip_addr = ('wp.pl','onet.pl','google.pl','facebook.pl')
$ip_addr.ForEach({Test-NetConnection -ComputerName $_})


$tab=1..10000
Measure-Command { foreach($i in $tab) {$i} } |select -Property Milliseconds
Measure-Command { $tab | ForEach-Object {$_} } | select -Property Milliseconds
Measure-Command { $tab.foreach({$_}) } | select -Property Milliseconds
