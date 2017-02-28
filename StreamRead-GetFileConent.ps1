Function StreamRead-GetFileConent {
    Param(
        [Parameter(Mandatory=$true)][string]$file
    )
    Process
    {
        $nl = [Environment]::NewLine
        
        [string]$fullfile = ""
        $readfile = New-Object System.IO.StreamReader($file)
        
        while (($line = $readfile.ReadLine()) -ne $null)
        {
            $fullfile += $line + $nl
        }

        $readfile.Dispose()
        return $fullfile
    }
}
