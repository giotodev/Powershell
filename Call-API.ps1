Function Call-API {
    Param(
        [Parameter(Mandatory=$true)][string]$apiparam
    )
    Process
    {
        $apiwebclient = New-Object System.Net.WebClient
        $resultset_json = $apiwebclient.DownloadString($apiparam) | ConvertFrom-Json
        $apiwebclient.Dispose()
        return $resultset_json
    }
}
