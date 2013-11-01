Function CheckServer{
    param (
        [string]$s
    )
    $error.Clear()
    try {
        enter-pssession $s
        if ($error) {"Invalid Server."}
        else {
        
            "Valid server."
            
            exit-pssession
        }
    }
    catch {
        "Error"
    }
}
