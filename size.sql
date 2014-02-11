$mdf = Get-ChildItem -Recurse -Include *.mdf "C:\Data\"
$agg = (($mdf | Measure-Object -Sum Length).Sum/1GB)
$agg
