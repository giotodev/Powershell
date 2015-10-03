Function Execute-Sql {
    Param(
        [string]$command
    )
    Process
    {
        $scon = New-Object System.Data.SqlClient.SqlConnection
        $scon.ConnectionString = "Data Source=SAMSUNG-PC\SQLEXPRESS;Initial Catalog=Bitcoin;Integrated Security=true;Connection Timeout=0"
        
        $cmd = New-Object System.Data.SqlClient.SqlCommand
        $cmd.Connection = $scon
        $cmd.CommandTimeout = 0

        try
        {
            $scon.Open()
            $cmd.ExecuteNonQuery()
        }
        catch [Exception]
        {
            Write-Warning $_.Exception.Message
        }
        finally
        {
            $scon.Dispose()
            $cmd.Dispose()
        }
    }
}
