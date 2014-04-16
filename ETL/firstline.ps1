$tName = $filename.Split("\") | Select-Object -Last 1
$tName = $tName.Replace("$extension","")

$f = Get-Content $filename | Select -First 1
## SECOND HERE
$f = "IF OBJECT_ID('" + $tName + "') IS NOT NULL BEGIN DROP TABLE " + $tName + " END CREATE TABLE ["+ $tName +"] ([" + $f + "] VARCHAR(MAX))"
## Grabs the first line of the file
