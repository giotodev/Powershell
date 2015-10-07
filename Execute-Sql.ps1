Function Execute-Sql {
    Param(
        [string]$command
    )
    Process
    {
        $scon = New-Object System.Data.SqlClient.SqlConnection
        $scon.ConnectionString = ""
        
        $cmd = New-Object System.Data.SqlClient.SqlCommand
        $cmd.Connection = $scon
        $cmd.CommandTimeout = 0
        $cmd.CommandText = $command

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
