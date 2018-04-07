
Function Do-Function {
  Param(
    [Parameter(Mandatory=$false)][string]$notrequired
    , [Parameter(Mandatory=$false)][ValidateSet("1","2","3","Other")]$set
    , [Parameter(Mandatory=$false)][ValidateRange(0,10)]$range
    , [Parameter(Mandatory=$false)][ValidateLength(5,20)][string]$length
    , [Parameter(Mandatory=$false)][ValidatePattern("[A-Z][-]\d{1}")][string]$pattern
    , [Parameter(Mandatory=$true)][ValidateLength(3,3)][ValidatePattern("[A-Z][-]\d{1}")][string]$double
  )
  Process
  {
  }
}
