Clear-Host
$path = "C:\Users\jacek\Documents"
$resPath = $path + "\resLog.txt"
$archPath = $path + "\Archive"
if(!(Test-Path $resPath))
{
New-Item -Path $resPath
}

$logs = Get-ChildItem -Path $path -File | Where-Object {$_.FullName -ne $resPath} | Sort-Object LastWriteTime
foreach($log in $logs)
{
$content = Get-Content -Path $log.FullName
Add-Content -Value $content -Path $resPath
Move-Item $log.FullName -Destination $archPath
Write-Host "Success: $log.Name" -BackgroundColor DarkGreen

}