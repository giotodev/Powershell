$drive = 'C:\'
Get-ChildItem $drive -Recurse | Where-Object {$_.Length -gt 1000MB}
