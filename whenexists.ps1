##start-sleep -s 10
##"Hello world!"

<#

$r = "C:\Users\Public\exist\"

foreach ($f in Get-ChildItem $r)
{
    foreach ($i in Get-ChildItem $f)
    {
        if (Test-Path ($r + "hi.txt"))
        {
            echo($i.Name)
        }
        else
        {
            "Nothing."
        }
    }
}

#>

$r = "C:\Users\Public\exist\"
$f = "hi.txt"
$s= $r + $f
$exist = (Test-Path $s)

while ($exist -eq $False)
{
    start-sleep -s 15
}

<#
if (!($exist))
{
    start-sleep -s 10
}
else
{
    echo "Found it!"
}
#>
