## Product a list of applications
$apps = Get-WmiObject -Query "SELECT * FROM Win32_Product"

## Specific
$spec = Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE Name LIKE '%specific%'"

## Uninstall
$spec.Uninstall()
