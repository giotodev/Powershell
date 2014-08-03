
Function FindFilePath ($path, $file)
{
    $files = Get-ChildItem $path -Recurse -ErrorAction SilentlyContinue | Where-Object { !$_.PSIsContainer -and [System.IO.Path]::GetFileNameWithoutExtension($_.Name) -like "*$file*" }

    foreach ($file in $files)
    {
        $file.FullName.Substring(0,$file.FullName.LastIndexOf("\")) | Get-Unique
    }
}

FindFilePath -path "C:\" -file "Microsoft.SqlServer.Smo"
