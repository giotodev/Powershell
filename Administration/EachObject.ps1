## Re-name description

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | out-null

$serv = new-object ('Microsoft.SqlServer.Management.Smo.Server') 'SERVER\INSTANCE'
$db = $serv.Databases["Database"]
## General, objects
$ts = $db.Tables

foreach ($t in $ts)
{
    $t.Name
}
