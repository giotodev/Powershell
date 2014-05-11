Function UnzipEverything($src, $dest)
{
   ## Deprecated:
   ##[System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
   Add-Type -AssemblyName System.IO.Compression.FileSystem
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

ZipEverything -src "\\sourcelocation\tracefiles\" -dest "\\destinationlocation\tracefiles\extract\"


Function ZipEverything($src, $dest)
{
   Add-Type -AssemblyName System.IO.Compression.FileSystem
   [System.IO.Compression.ZipFile]::CreateFromDirectory($src, $dest)
}

UnzipEverything -src "C\\destinationlocation\tracefiles\extract" -dest "\\sourcelocation\tracefiles\file.zip"