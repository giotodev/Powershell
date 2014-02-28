<#

  This script will compare jobs in a QA environment to jobs in a PROD environment then script out the jobs in QA that
  don't exist in PROD.
  
  After the step $j.Script() | Out-File $jobFile, we can add $j.Drop if we want to remove the job.
  Save script to variable, use variable to .Replace("string","stringtwo")
  
#>


## This is the only part we need to edit:
$qa = "QASERVER\INST"
$prod = "PRODSERVER\INST"
$file = "C:\OurJobPath\"



Function CleanStrings ($string)
{
    [System.Text.RegularExpressions.Regex]
    $x = [System.Text.RegularExpressions.Regex]::Replace($string,"[^1-9a-zA-Z_]","")
    return $x
}


[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | Out-Null

$p = New-Object "Microsoft.SqlServer.Management.Smo.Server" $prod
$q = New-Object "Microsoft.SqlServer.Management.Smo.Server" $qa

$copyit = $p.JobServer.Jobs | Select-Object -ExpandProperty Name
$cleanit = $q.JobServer.Jobs | Select-Object -ExpandProperty Name

$arr = Compare-Object $copyit $cleanit |
        Where-Object {$_.SideIndicator -ne "<="} |
        Select-Object -ExpandProperty InputObject

foreach ($j in $q.JobServer.Jobs)
{
    if ($arr -like $j.Name) ##-and ($arr -notlike "*word*")
    {
        $jName = $j.Name
        $jName = CleanStrings $jName
        $jobFile = $file + $jName + ".sql"
        Write-Host $jobFile
        $j.Script() | Out-File $jobFile
    }
}
