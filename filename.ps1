## One file only
$n = Get-ChildItem "C:\files\" *.csv | Select-Object BaseName
$name = $n.BaseName
## Re-use
$cont = "C:\files\" + $name + ".csv"
$bi = $name.ToUpper() + "plusstring"
