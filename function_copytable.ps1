Function CopyTable($srcServer, $srcDatabase, $destServer, $destDatabase, $bothTable)
{

    $src = New-Object System.Data.SqlClient.SQLConnection
    $dest = New-Object System.Data.SqlClient.SQLConnection
    $src.ConnectionString = "SERVER=" + $srcServer + ";DATABASE=" + $srcDatabase + ";Integrated Security=True"
    $dest.ConnectionString = "SERVER=" + $destServer + ";DATABASE=" + $destDatabase + ";Integrated Security=True"
    $data = "SELECT * FROM " + $bothTable
    $getData = New-Object System.Data.SqlClient.SqlCommand($data, $src)

    try
    {
        $src.Open()
        $dest.Open()
        [System.Data.SqlClient.SqlDataReader] $reading = $getData.ExecuteReader()

        try
        {
            $copy = New-Object Data.SqlClient.SqlBulkCopy($dest)
            $copy.DestinationTableName = $bothTable
            $copy.WriteToServer($reading)
            Write-Host "Table copied from " + $srcServer + " to " + $destServer + "."
        }
        catch [System.Exception]
        {
            $ex = $_.Exception
            throw($ex.Message)
        }
        finally
        {
            $reading.Close()
            $src.Close()
            $copy.Close()
        }
    }
    catch
    {
        throw("Cannot open a connection to " + $destServer + ".")
    }
}

CopyTable -srcServer "SERVONE\IN" -srcDatabase "DBOne" -destServer "SERVTWO\IN" -destDatabase "DBTwo" -bothTable "Table"

