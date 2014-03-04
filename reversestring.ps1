## Strings

Function Reverse ($s)
{
    $r = $s -split ""
    [array]::Reverse($r)
    return $r -join ""
}

Reverse -s "This is like the REVERSE function in TSQL"

## Numbers

$x = 12363748374
$x = $x.ToString()
$x = Reverse -s $x
$x
