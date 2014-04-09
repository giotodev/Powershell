## If importing a file, and only needing to import the latest file, this will remove all older files and keep the most recent file
## Put this in a step before the import

Function RemoveEarliestFiles($loc)
{
    $fs = Get-ChildItem -Path $loc -Recurse | Where-Object {$_.PsIsContainer -ne $True}
    $fs | Sort-Object LastWriteTime | Select-Object -First ($files.Count - 1) | Remove-Item
}

RemoveEarliestFiles -loc "C:\files\"
