$nl = [Environment]::NewLine

## OS
$os = (Get-WmiObject -class "Win32_OperatingSystem").Caption

## Bit System
$bit = (Get-WmiObject win32_operatingsystem).OSArchitecture

## Gig Memory
$mem = ((Get-WmiObject -Class "Win32_PhysicalMemory").Capacity/(1024*1024*1024))

## Hard Drive Space name, total size, available free space
$ds = Get-WmiObject -Class "Win32_LogicalDisk" | Select-Object Name, Size, FreeSpace
$nl
Write-Host "What is your OS?"
$os
$nl
Write-Host "64 or 32 bit?"
$bit
$nl
Write-Host "Available memory?" $nl
$mem
$nl
Write-Host "Hard drive capability and free space?" $nl
$nl
foreach ($d in $ds)
{
    $d.Name + " available space - " + ($d.Size/(1024*1024*1024)).ToString() + ", free space - " + ($d.FreeSpace/(1024*1024*1024)).ToString()
}
