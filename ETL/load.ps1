## Set-ExecutionPolicy unrestricted
## Import-Module SQLPS

Function LoadCSV ($server, $database, $table)
{
    $table = "SeveralColumns"
    invoke-sqlcmd -query "SELECT * FROM $table" -database $database -serverinstance $server | export-csv -path "C:\files\$table.csv"
}

## Set-ExecutionPolicy restricted