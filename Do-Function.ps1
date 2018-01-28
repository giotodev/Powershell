
Function Do-Function {
  Param(
    [Parameter(Mandatory=$false)][string]$notrequired
    , [Parameter(Mandatory=$true)][ValidateSet("1","2","3","Other")]$set
  )
  Process
  {
    Write-Host "Is the parameter included?  $notrequired$set"
  }
}
