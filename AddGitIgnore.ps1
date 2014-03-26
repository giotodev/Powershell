$path = "C:\GitHub\Projects" ## GitHub location
$gFolders = Get-ChildItem -path $path | Select-Object Name

foreach ($f in $gFolders)
{
    $x = $path + "\" + $f.Name + "\.gitignore"
    if (Test-Path $x)
    {
    }
    else
    {
        Write-Host "Git ignore file missing for the" $f.Name "project."
    }
}
