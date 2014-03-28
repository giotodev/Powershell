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

    foreach ($table in $db.Tables)
    {
        $x = $table.Name
        if ($x -like $trash)
        {
            $eachTable += $x
        }
    }
    
    foreach ($i in $eachTable)
    {
        $scon.Open()
        $cmd.CommandText = "DROP TABLE " + $i
        $cmd.ExecuteNonQuery()
        $scon.Close()
    }

}

DropTrashTables -server "SAMSUNG-PC\SQLEXPRESS" -database "durkah" -trash "*_TBD*"