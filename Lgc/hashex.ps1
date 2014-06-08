$comptable = @{}
$comptable.CurrentPowerShellVersion = $host.Version.ToString()
$comptable.WindowsVersion = "Windows 7"
$comptable.RamInGig = Get-CimInstance -Class "CIM_PhysicalMemory" | % {$_.Capacity / 1073741824}
$comptable.HardDriveInGig = $disk = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'" | % {$_.Size / 1073741824}

$comptable

$comptable.Remove("HardDriveInGig")
Write-Host "
What does it look like with the value removed?
"

$comptable

<#
$x = New-Object PSObject -Property $comptable

$x

$x | Format-Table WindowsVersion, Ram, HardDriveInGig, CurrentPowerShellVersion
#>
