## Set-ExecutionPolicy unrestricted
## Import-Module SQLPS

Function PSLoad ($server, $database, $table, $path)
{
    $path = $path + $table + ".txt"
    invoke-sqlcmd -query "SELECT * FROM $table" -database $database -serverinstance $server | Out-File -FilePath $path -Encoding string
}

PSLoad -server "SRV\INST" -database "DB" -table "Table" -path "C:\Files\"

## Set-ExecutionPolicy restricted