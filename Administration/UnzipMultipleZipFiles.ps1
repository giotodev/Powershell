Function UnzipEverything($src, $dest)
{
   Add-Type -AssemblyName System.IO.Compression.FileSystem
   $zps = Get-ChildItem $src -Filter *.zip

   foreach ($zp IN $zps)
   {
       $all = $src + $zp
       [System.IO.Compression.ZipFile]::ExtractToDirectory($all, $dest)
   }
}

UnzipEverything -src "\\sourcelocation\tracefiles\" -dest "\\destinationlocation\tracefiles\extract\"

Function ZipEverything($src, $dest)
{
   Add-Type -AssemblyName System.IO.Compression.FileSystem
   [System.IO.Compression.ZipFile]::CreateFromDirectory($src, $dest)
}

ZipEverything -src "C\\destinationlocation\tracefiles\extract" -dest "\\sourcelocation\tracefiles\file.zip"