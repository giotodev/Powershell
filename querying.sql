$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
$SqlConnection.ConnectionString = "SERVER=[SERVER];Integrated Security=true;DATABASE=master"


$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
$SqlCmd.CommandText = "SELECT name FROM sys.databases"
$SqlCmd.Connection = $SqlConnection
