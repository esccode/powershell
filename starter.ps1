#Get-Process
#Get-Item
#Get-Service spooler
# CTRL j  /szablony

Write-Warning " Warning Podaj dwie liczby:"
Write-Information " Info Podaj dwie liczby:"
Write-Output "Outout Podaj dwie liczby:"
$x = Read-Host "liczba 1"
$y = Read-Host "Liczba 2"
if ($x -gt $y)
{
    Write-Host "$x -gt $y "
}

else
{
  Write-Host " $x -le $y"  
}


pause
Write-Output " Polecenie ping:"
for ($i = 0; $i -lt 1; $i++)
{ 
     Test-NetConnection -ComputerName 192.168.188.$i
}

pause
Write-Output " Read your variable:"
# To jest komentarz, a nie polecenie.
$a = Read-Host "Please enter your name"
Write-Host `
    "Czesc $a"

pause
$a = Read-Host "Write path to listing"

Get-ChildItem $a |
    Sort-Object Length –Descending

pause
Write-Output " Write from arrey"
$a = 1,2,3,4,5; $b = $a[4];
Write-Host $b

pause

Write-Output " Write from csv file"
$a = Get-Content D:\data\cennik-dest.csv
$a[0]

pause