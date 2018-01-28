
Function Do-Function {
  Param(
    [Parameter(Mandatory=$false)][string]$notrequired
    , [Parameter(Mandatory=$true)][ValidateSet("1","2","3","Other")]$set
    , [Parameter(Mandatory=$true)][ValidateRange(0,10)]$range
    , [Parameter(Mandatory=$true)][ValidateLength(5,20)][string]$length
  )
  Process
  {
    Write-Host "Is the parameter included?  $notrequired$set"
    Write-Host (20/$range).ToString()
  }
}
