Function ZipEverything($src, $dest)
 {
    [System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
    $zps = Get-ChildItem $src -Filter *.zip

    foreach ($zp IN $zps)
    {
        $all = $src + $zp
        [System.IO.Compression.ZipFile]::ExtractToDirectory($all, $dest)
    }

    ## Server, Database, Table - IMP ONLY
    ##$scon = New-Object System.Data.SqlClient.SqlConnection
    ##$scon.ConnectionString = "SERVER=" + $server + ";DATABASE=" + $database + ";Integrated Security=true"
 }

 ZipEverything -src "\\sourcelocation\tracefiles\" -dest "\\destinationlocation\tracefiles\"

