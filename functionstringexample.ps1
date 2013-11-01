## Function

Function ReturnString {
    param (
        [string]$s
    )
    if ($s -match "user")
    {
        $true
    }
    else 
    {
        $false
    }
}

## Examples

ReturnString -s 'hacker'

ReturnString -s 'user'
