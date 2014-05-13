Function ShowNumbers ([int[]]$numbs)
{
    foreach ($n in $numbs)
    {
        Write-Host $n.ToString()
    }
}

ShowNumbers -numbs 1,2,3,4,5
