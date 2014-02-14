<#

  This script will compare jobs in a QA environment to jobs in a PROD environment then script out the jobs in QA that
  don't exist in PROD (and remove those jobs - though this step is coded out).
  
#>


## This is the only part we need to edit:
$qa = "QASERVER\INST"
$prod = "PRODSERVER\INST"
$file = "C:\OurJobPath\"


Function CleanStrings ($string)
{
    $x = $string.Replace("\","")
    $x = $x.Replace("/","")
    $x = $x.Replace("#","")
    $x = $x.Replace(":","")
    $x = $x.Replace("(","")
    $x = $x.Replace(")","")
    return $x
}


[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | Out-Null

$p = New-Object "Microsoft.SqlServer.Management.Smo.Server" $prod
$srv = New-Object "Microsoft.SqlServer.Management.Smo.Server" $qa

$copyfrom = $p.JobServer.Jobs | Select-Object -ExpandProperty Name
$copyto = $srv.JobServer.Jobs | Select-Object -ExpandProperty Name

$arr = Compare-Object $copyfrom $copyto |
        Where-Object {$_.SideIndicator -ne "<="} |
        Select-Object -ExpandProperty InputObject

foreach ($j in $srv.JobServer.Jobs)
{
    if ($arr -like $j.Name)
    {
        $jName = $j.Name
        $jName = CleanStrings $jName
        $jobFile = $file + $jName + ".sql"
        Write-Host $jobFile
        $j.Script() | Out-File $jobFile
        ## $j.Drop
    }
}
