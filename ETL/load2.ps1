Function PSLoad($server, $database, $query, $location)
{
    $scon = New-Object System.Data.SqlClient.SqlConnection
    $scon.ConnectionString = "SERVER=" + $server + ";DATABASE=" + $database + ";Integrated Security=true"

    $cmd = New-Object System.Data.SqlClient.SqlCommand
    $ad = New-Object System.Data.SqlClient.SqlDataAdapter
    $ds = New-Object System.Data.DataSet
    $scon.Open()
    $cmd.CommandText = $query
    $cmd.Connection = $scon
    $ad.SelectCommand = $cmd
    $ad.Fill($ds)
    $scon.Close()
    $ds.Tables[0] | Export-Csv -NoTypeInformation $location
    
}

PSLoad -server "SEV" -database "DB" -query "SELECT * FROM SeveralColumns" -location "C:\files\sev.csv"