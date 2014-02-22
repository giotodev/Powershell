Function VG_Walk ($m)
{
    $m = $m + 1
    return $m
}

Function VG_Run ($m)
{
    $r = $r + 2
    return $r
}

$x = 1

while ($true)
{
    $x = VG_Walk -m $x
    $x
}
