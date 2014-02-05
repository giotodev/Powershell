$srv = "SERV\INST"

Function Clean ($p)
{
    $p = $p.ToString()
    $p = $p.Replace("[","")
    $p = $p.Replace("]","")
    return $p
}


[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | out-null
$smo = New-Object ("Microsoft.SqlServer.Management.Smo.Server") $srv
$scon = New-Object System.Data.SqlClient.SQLConnection
$dbarray = $smo.Databases


foreach ($db in $dbarray)
{
    $db = Clean -p $db
    $scon.ConnectionString = "SERVER=" + $srv + ";DATABASE=" + $db + ";Integrated Security=True"
    $reindex = ""
    $scon.Open()

    try
    {
        $com = New-Object Data.SqlClient.SqlCommand
        $com.CommandText = $reindex
        $com.Connection = $scon
        $com.ExecuteNonQuery()
    }
    catch
    {
        Write-Host "Error for" $db
    }

    $scon.Close()
}
