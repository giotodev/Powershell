$v = (Get-Service -DisplayName 'SQL Server (SQLEXPRESS)').Status
if ($v = "Running") {
    "SQL Server is running correctly."
}
else {
    Start-Service -DisplayName 'SQL Server (SQLEXPRESS)'
}

## Stop-Service -DisplayName 'SQL Server (SQLEXPRESS)'
