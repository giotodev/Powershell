$loc = "C:\Vacation\"
$fs = Get-ChildItem $loc -Filter *.png
$x = 1

Function RenameWithDateAndIncrement($locationPath, $fileName, $extension, $inc)
{
    $date = Get-Date -uFormat "%Y%m%d"

    $old = $locationPath + $fileName
    $new = $locationPath + $inc + "_" + $date + $extension

    Rename-Item $old $new
}

foreach ($f in $fs)
{
    RenameWithDateAndIncrement -locationPath $loc -fileName $f -extension ".png" -inc $x
    $x = $x + 1
}