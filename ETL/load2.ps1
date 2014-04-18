Function PSLoad_CSV($server, $database, $query, $location, $filename)
{
    $scon = New-Object System.Data.SqlClient.SqlConnection
    $scon.ConnectionString = "SERVER=" + $server + ";DATABASE=" + $database + ";Integrated Security=true"
    $export = $location + $filename + ".csv"

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

PSLoad_CSV -server "SRV\INST" -database "DB" -query "SELECT * FROM Table" -location "C:\files\" -filename "Table"