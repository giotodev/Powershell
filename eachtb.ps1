[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | out-null

$serv = new-object ('Microsoft.SqlServer.Management.Smo.Server') 'SERVER\INSTANCE'
$db = $serv.Databases["Database"]
$ts = $db.Tables

foreach ($t in $ts)
{
    $t.Name
}
