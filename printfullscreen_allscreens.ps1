Function PrintScreen-Full ($loc) {
    $vs = [Windows.Forms.SystemInformation]::VirtualScreen
    $draw = New-Object Drawing.Bitmap $vs.Width, $vs.Height
    $graph = [Drawing.Graphics]::FromImage($draw)
    $graph.CopyFromScreen( $vs.Location, [Drawing.Point]::Empty, $vs.Size)
    $graph.Dispose()
    $draw.Save($loc)
    $draw.Dispose()
}

PrintScreen-Full -loc "C:\files\full.jpg"