$mfl = Get-ChildItem "C:\F\" -Filter *.json

foreach ($fl in $mfl)
{
    Move-Item $fl.FullName "C:\T\"
}
