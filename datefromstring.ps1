<# 

  Extract TSQL DATE or DATETIME format from file.
  File Length: $c.Length

#>



Function ReturnDate ($file)
{
    ##$c = Get-Content "C:\File.txt"
    $c = Get-Content $file
    $f = $c[0]
    $f = $f.Substring(0,20)
    $f = [RegEx]::Matches($f,"(\d{14})") | Select-Object -ExpandProperty Value
    $sqlDate = $f.Substring(0,4) + "-" + $f.Substring(4,2) + "-" + $f.Substring(6,2)
    $sqlDateTime = $f.Substring(0,4) + "-" + $f.Substring(4,2) + "-" + $f.Substring(6,2) + " " + $f.Substring(8,2) + ":" + $f.Substring(10,2) + ":" + $f.Substring(12,0)
    $sqlDate, $sqlDateTime
}

ReturnDate -file "C:\Files\File.txt"


Function ReturnDate ($file)
{
    $f = Get-Content "C:\File20140101.txt"
    $f = [RegEx]::Matches($f,"(\d{8})") | Select-Object -ExpandProperty Value
    $sqlDate = $f.Substring(0,4) + "-" + $f.Substring(4,2) + "-" + $f.Substring(6,2)
    $sqlDate
}
