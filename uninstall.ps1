##  Product a list of applications
$apps = Get-WmiObject -Query "SELECT * FROM Win32_Product"

##  pecific
$spec = Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE Name LIKE '%specific%'"

##  Uninstall
$spec.Uninstall()

##  Foreach approach
$apps = Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE Name LIKE '%ProductOne%' OR Name LIKE '%ProductTwo%'"

foreach ($app in $apps)
{
  $app.Uninstall()
}
