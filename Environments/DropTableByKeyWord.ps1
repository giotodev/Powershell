Function DropTrashTables ($server, $database, $trash)
{

    [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.SqlServer.SMO')  | Out-Null

    $srv =  New-Object ('Microsoft.SqlServer.Management.SMO.Server') $server
    $scon = New-Object System.Data.SqlClient.SqlConnection
    $scon.ConnectionString = "SERVER=" + $server + ";Integrated Security=true;DATABASE=" + $database
    $cmd = New-Object System.Data.SqlClient.SqlCommand
    $cmd.Connection = $scon
    $eachTable = @()
    $db = $srv.Databases[$database]
    ## Older than this timespan, will be removed
    $three = New-TimeSpan -Days 90

    foreach ($table in $db.Tables)
    {
        $x = $table.Name
        $d = $table.CreateDate
        if ($x -like $trash -and (((get-date) - $d) -gt $three))
        {
            $eachTable += $x
        }
    }

    ## Testing other

    foreach ($i in $eachTable)
    {
        $scon.Open()
        $cmd.CommandText = "DROP TABLE " + $i
        $cmd.ExecuteNonQuery()
        $scon.Close()
    }


}

DropTrashTables -server "S\I" -database "DB" -trash "*KEYWORD*"