$table = "
IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = '')
BEGIN



END
"


Function Create-TableIfNotExists {
    Param(
        [Parameter(Mandatory=$true)][string]$table
    )
    Process
    {
        Execute-Sql -command $table
    }
}


Function Return-APIJson {
    Param(
        [Parameter(Mandatory=$true)][string]$apiaddress
    )
    Process
    {
        $webclientextract = New-Object System.Net.WebClient
        $returnresult = $webclientextract.DownloadString($apiaddress) | ConvertFrom-Json
        $webclientextract.Dispose()
        return $returnresult
    }
}
