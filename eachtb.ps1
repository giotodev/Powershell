[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | out-null

$serv = new-object ('Microsoft.SqlServer.Management.Smo.Server') 'SAMSUNG-PC\SQLEXPRESS'
$db = $serv.Databases["CrossFit"]
$ts = $db.Tables

foreach ($t in $ts)
{
    $t.Name
}
