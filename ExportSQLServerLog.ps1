[reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") 
$instance = "OurDatabaseName"
$sqlServer = new-object ("Microsoft.SqlServer.Management.Smo.Server") "$instanceName" 
$sqlServer.ReadErrorLog() | Out-File C:\OurFilePath.txt