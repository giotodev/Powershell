Function CompareDatabaseTables ($s, $csrc, $comp, $loc)
{

    [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | Out-Null
    $serv = New-Object ("Microsoft.SqlServer.Management.Smo.Server") $s

    $t1 = $serv.Databases["$csrc"].Tables | Select-Object -ExpandProperty Name
    $t2 = $serv.Databases["$comp"].Tables | Select-Object -ExpandProperty Name

    $match = Compare-Object $t1 $t2 | Where-Object { $_.SideIndicator -eq "<=" } | Select-Object -ExpandProperty InputObject
    $scr += "/* --Tables: `r`n " + $match + "`r`n */ `r`n"

    foreach ($t in $serv.Databases["$csrc"].Tables)
    {
        if ($match -like $t.Name)
        {
            $scr += "`r`n" + $t.Script()
        }

        $scr | Out-File $loc
    }
}

CompareDatabaseTables -s "SERVER\INSTANCE" -csrc "DATABASE" -comp "Copy" -loc "C:\files\file.txt"