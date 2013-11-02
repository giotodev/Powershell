$file = "C:\Import\data.txt"


if (Test-Path $file) {
    "File Exists"
}
else {
    "File not present"
}

## Other (tweak)

$x = 1

while($x = 1){
    
    if (Test-Path "C:\Import\data.txt"){
        "File found!"
        break
    }
    else {
        "Checking again in thirty seconds ..."
        Start-Sleep -s 30
    }        
    
 }
