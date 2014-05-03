
$s = ""
$d = ""
$o = ""

$scon = New-Object System.Data.SqlClient.SqlConnection
$scon.ConnectionString = "SERVER=" + $s + ";DATABASE=" + $d + ";Integrated Security=true"
$trycmd = New-Object System.Data.SqlClient.SqlCommand
$catchcmd = New-Object System.Data.SqlClient.SqlCommand
$trycmd.CommandText = ""
$trycmd.Connection = $scon
$catchcmd.CommandText = ""
$catchcmd.Connection = $scon


try
{
  $scon.Open()
  $trycmd.ExecuteNonQuery()
}
catch
{
  $catchcmd.ExecuteNonQuery()
}
finally
{
  $scon.Close()
  $scon.Dispose()
}
