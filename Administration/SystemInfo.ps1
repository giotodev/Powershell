## Bit System
Get-WmiObject win32_operatingsystem | Select-Object OSArchitecture

## Gig Memory
((Get-WmiObject -Class "Win32_PhysicalMemory").Capacity/(1024*1024*1024))

## Hard Drive Space name, total size, available free space
$ds = Get-WmiObject -Class "Win32_LogicalDisk" | Select-Object Name, Size, FreeSpace

foreach ($d in $ds)
{
    $d.Name + " available space - " + ($d.Size/(1024*1024*1024)).ToString() + ", free space - " + ($d.FreeSpace/(1024*1024*1024)).ToString()
}
