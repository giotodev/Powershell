$comp = [System.Net.Dns]::GetHostName() ## Another approach
$strComputer = $env:COMPUTERNAME ## Computer Name
$nullFile = "C:\" + $strComputer + "\nullfile.txt"


if (Test-Path $nullFile)
{
    Remove-Item $nullFile
    New-Item $nullFile -ItemType file
}
else
{
    New-Item $nullFile -ItemType file
}
