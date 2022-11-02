
$data = Get-Date -Format "dd_MM_yy"
$sciezka = Read-Host " `n `n please specify path to the directory you want to backup. `n example: C:\Users\marcin13\desktop\icons\x `n `n default path $home"

if( Test-Path -path "$HOME\backups\$data\")
{
 Set-Location "$HOME\backups\$data\"
$files= (Get-ChildItem | Measure-Object).Count +1
}
Set-Location $sciezka
Copy-Item -Path $sciezka -Destination "$HOME\backups\$data\backup_$files" -Recurse -force
write-output "`n `n  saved as: $data/ backup_/ $files"


$plikvbs = Get-ChildItem -Path "$HOME" -Filter backup_finished.vbs -Recurse -Depth 4 | ForEach-Object{$_.FullName} 
$acommand = "C:\Windows\System32\Cscript.exe $plikvbs"
Invoke-Expression $acommand
