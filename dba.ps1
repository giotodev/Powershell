[reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo")
$sqlServer = new-object Microsoft.SqlServer.Management.Smo.Server -ArgumentList "Timothy\sqlexpress"
$sqlServer.Databases | Out-File C:\Scripts\dba.txt
