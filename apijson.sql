<#
## The "GET"
$w = [System.Net.WebRequest]::Create("[JSONAPIWEBSITE]")
$w.Method = "GET"
$w.GetResponse()
#>


$dJSON = @"
{"keyone": "value1", "keytwo": "value2", "keythree": "value3", "keyfour": 45362, "final": 65893.22}
"@
$p = $dJSON | ConvertFrom-Json
## All
$p
## Individual
$p.keyone
$p.keytwo
$p.keythree
$p.keyfour
$p.final
