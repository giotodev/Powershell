$scon = New-Object System.Data.SqlClient.SqlConnection
$scon.ConnectionString = "SERVER=SRV;Integrated Security=true;DATABASE=DB"
$add = New-Object System.Data.SqlClient.SqlCommand
$add.Connection = $scon
$ev = @()
$x = Get-Content "C:\Files\file.csv" | ConvertFrom-Csv
foreach ($v in $x)
{
    ##$ev += $v.high.ToString() + "," + $v.timestamp.ToString() #JB
    $ev += "('" +$v.high.ToString() + "','" + $v.timestamp + "'),"
}

$ev = "VALUES " + $ev
$ev = $ev.Substring(0,$ev.Length-1)
$ev

$scon.Open()
$add.CommandText = "INSERT INTO AddBit " + $ev
$add.ExecuteNonQuery()
$scon.Close()