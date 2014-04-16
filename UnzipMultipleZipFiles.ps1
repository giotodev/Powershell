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

 ZipEverything -src "\\dfsrvetl\loadstore\MLS-CL\incoming\" -dest "\\dfsrvetl\loadstore\MLS-CL\extract\"