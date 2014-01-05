$f = "C:\Upload\file.txt"
if (Test-Path $f)
{
    (Get-Item $f).Length -gt 25MB
}
