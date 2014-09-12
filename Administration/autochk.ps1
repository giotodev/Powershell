
Function AutoCheckPoint($db, $srv)
{
    $scon = New-Object System.Data.SqlClient.SqlConnection
    $scon.ConnectionString = "SERVER=$srv;DATABASE=$db;Integrated Security=true"
    $chk = New-Object System.Data.SqlClient.SqlCommand
    $chk.CommandText = "CHECKPOINT;"
    $chk.Connection = $scon

    $scon.Open()
    $chk.ExecuteNonQuery()
    $scon.Close()
    $scon.Dispose()
}
