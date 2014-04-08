Function MoveFileByType($extension, $s)
{
    $start = $s
    $date = Get-Date -uFormat "%Y%m%d"
    
    if ($extension -eq ".txt")
    {
        $locationPath = "C:\files\TXT\"
        $fs = Get-ChildItem $start -filter *.txt
        foreach ($f in $fs)
        {
            $c = $start + $f.Name
            $m = $locationPath + $f.Name
            Move-Item $c $m
        }
    }
    elseif ($extension -eq ".csv")
    {
        $locationPath = "C:\files\CSV\"
        $fs = Get-ChildItem $start -filter *.csv
        foreach ($f in $fs)
        {
            $c = $start + $f.Name
            $m = $locationPath + $f.Name
            Move-Item $c $m
        }
    }
    elseif ($extension -like ".xls*")
    {
        $locationPath = "C:\files\EXCEL\"
        $fs = Get-ChildItem $start -filter *.xlsx
        foreach ($f in $fs)
        {
            $c = $start + $f.Name
            $m = $locationPath + $f.Name
            Move-Item $c $m
        }
        $fs = Get-ChildItem $start -filter *.xls
        foreach ($f in $fs)
        {
            $c = $start + $f.Name
            $m = $locationPath + $f.Name
            Move-Item $c $m
        }
    }
    else
    {
        "Add exception"
    }
}

$ss = Get-ChildItem "C:\files\"

foreach ($s in $ss)
{
    $s = $s.Extension
    MoveFileByType -extension $s -s "C:\files\"
}
