Function VerifyBackups($server, $bakLocation)
{
    $scon = New-Object System.Data.SqlClient.SqlConnection("SERVER=" + $server + ";DATABASE=master;Integrated Security=true")
    $scon.FireInfoMessageEventOnUserErrors = $true
    $cmd = New-Object System.Data.SqlClient.SqlCommand
    $cmd.Connection = $scon
    $fs = Get-ChildItem $bakLocation -filter *.BAK
    
    foreach ($f in $fs)
    {
        $ef = $f.BaseName
        $full = $bakLocation + $f
        $cmd = "RESTORE VERIFYONLY FROM DISK = '" + $full + "'"

        try
        {
            $scon.Open()
            $cmd.ExecuteNonQuery()
            $scon.Close()
        }
        catch
        {
            Write-Host "Unable to verify."
        }
    }
}

VerifyBackups -server "TIMOTHY\SQLEXPRESS" -bakLocation "D:\Backup\"