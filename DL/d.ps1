Function DNEC_Assessment($t, $c, $no = $null, $de = $null)
{
    $time = Get-Date

    $b_json = '{ _id: "' + $time.ToString() + '", '
    $b_json += '"title": "' + $t + '"'

    if ($no -ne "")
    {
        $b_json += ', "number": ' + $no
    }

    if ($de -ne "")
    {
        $b_json += ', "details": "' + $de + '"'
    }

    $b_json += ', "comments": "' + $c + '" }'
    $b_json
}

## EXAMPLE:
DNEC_Assessment -t "DEV" -c "ta7" -no 7 -de "nw 7"

