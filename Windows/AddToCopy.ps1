Function AddToCopy ($update)
{
    [Windows.Forms.Clipboard]::Clear()
    $update = "a.$update f.$update $a.update $update"
    [Windows.Forms.Clipboard]::SetText($update)
}
 
AddToCopy -up "String"
