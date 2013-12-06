$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
$SqlConnection.ConnectionString = "SERVER=OURSERVER;Integrated Security=true;DATABASE=OURDATABASE"

$SqlConnection.Open()
$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
$SqlCmd.Connection = $SqlConnection
$SqlCmd.CommandText = "SQL STATEMENT @p"
$SqlCmd.Parameters.Add("@p", $obj)
##$SqlCmd.ExecuteNonQuery()
##$SqlCmd.ExecuteReader()
## Begin read output
$handler = [System.Data.SqlClient.SqlInfoMessageEventHandler] {param($sender, $event) Write-Host $event.Message }; 
$SqlConnection.add_InfoMessage($handler); 
$SqlConnection.FireInfoMessageEventOnUserErrors = $true;
## End read output
$SqlConnection.Close()
