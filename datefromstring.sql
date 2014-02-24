<# 

  Extract TSQL DATE or DATETIME format from file.

#>



Function ReturnDate ($file)
{
    ##$c = Get-Content "C:\File.txt"
    $c = Get-Content $file
    $f = $c[0]
    $f = $f.Substring(0,20)
    $f = [RegEx]::Matches($f,"(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})") | Select-Object -ExpandProperty Value
    $sqlDate = $f.Substring(0,4) + "-" + $f.Substring(5,2) + "-" + $f.Substring(7,2)
    $sqlDateTime = $f.Substring(0,4) + "-" + $f.Substring(5,2) + "-" + $f.Substring(7,2) + " " + $f.Substring(9,2) + ":" + $f.Substring(11,2) + ":" + $f.Substring(13)
    $sqlDate, $sqlDateTime
}

ReturnDate -file "C:\Files\File.txt"
