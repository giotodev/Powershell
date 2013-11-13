��## ONLY change these values inside the parentheses (all are strings so the values need to remain in parenthesis)

$SQLServer = "OurServerName"
$Database = "OurDatabaseName"
$filename = "C:\Users\Public\OurFileName.csv"
$Query = "OurQuery"



## These values don't change

$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
$SqlConnection.ConnectionString = "Server=$SQLSERVER;Database=$DATABASE;Integrated Security=True"
$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
$SqlCmd.CommandText = $Query
$SqlCmd.Connection = $SqlConnection
$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
$SqlAdapter.SelectCommand = $SqlCmd
$DataSet = New-Object System.Data.DataSet
$SqlAdapter.Fill($DataSet)
$SqlConnection.Close()
$DataSet.Tables[0] | export-csv -NoTypeInformation $filename
