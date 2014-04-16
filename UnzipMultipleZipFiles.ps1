Function ZipEverything($src, $dest)
 {
    [System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
    $zps = Get-ChildItem $src -Filter *.zip

    foreach ($zp IN $zps)
    {
        $all = $src + $zp
        [System.IO.Compression.ZipFile]::ExtractToDirectory($all, $dest)
    }
 }

 ZipEverything -src "\\sourcelocation\tracefiles\" -dest "\\destinationlocation\tracefiles\"
