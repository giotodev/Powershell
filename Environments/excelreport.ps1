$ex = New-Object -ComObject Excel.Application
$ex.Visible = $true
$wb = $ex.WorkBooks.Add()
$wb.WorkSheets.Item(1).Name = "Report"
$wb.WorkSheets.Item(3).Delete()
$wb.WorkSheets.Item(2).Delete()
$ws = $wb.WorkSheets.Item("Report")
$ws.Cells.Item(1,1) = "ServerOne"
$ws.Cells.Item(1,2) = "ServerTwo"
