$from = ""
$all = $From + "*"
$to = ""
$cnt = (Get-ChildItem $from | Measure-Object).Count

if ($cnt -eq 0)
{
    foreach ($m in (Get-ChildItem $to))
    {
        Remove-Item $m.FullName
    }
}
else
{
    Copy-Item $all $to -Force
}
