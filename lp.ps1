<#

CREATE TABLE PowerShellTest(
	High VARCHAR(100),
	Last VARCHAR(100),
	TimeStamp VARCHAR(100),
	Bid VARCHAR(100),
	Volume VARCHAR(100),
	Low VARCHAR(100),
	Ask VARCHAR(100)
)


#>

$w = (new-object net.webclient).DownloadString("")
$p = $w | ConvertFrom-Json

$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
$SqlConnection.ConnectionString = "SERVER;Integrated Security=true;DATABASE=DATABASE"

$SqlConnection.Open()
$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
$SqlCmd.Connection = $SqlConnection
$SqlCmd.CommandText = "INSERT INTO PowerShellTest VALUES (@1, @2, @3, @4, @5, @6, @7)"
$SqlCmd.Parameters.Add("@1", $p.high)
$SqlCmd.Parameters.Add("@2",$p.last)
$SqlCmd.Parameters.Add("@3",$p.timestamp)
$SqlCmd.Parameters.Add("@4",$p.bid)
$SqlCmd.Parameters.Add("@5",$p.volume)
$SqlCmd.Parameters.Add("@6",$p.low)
$SqlCmd.Parameters.Add("@7",$p.ask)
$SqlCmd.ExecuteNonQuery()
$SqlConnection.Close()
