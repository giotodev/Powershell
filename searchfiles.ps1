## Finds the line of text in a file (will produce multiple results for multiple appearances)
Select-String -Simple "word" document.txt

## Search for lines in multiple files
Get-ChildItem -Filter *.txt -Recurse | Select-String "word"

## Finds patterns in text files
Select-String "....-..-.." document.txt
Select-String "ERR.." document.txt

## Info on RegEx matches
Select-String "ERR.." document.txt | Select -Expand Matches
Select-String "ERR.." document.txt | Select -Expand Matches | Select -Expand Value

## Multiple files
 Get-ChildItem -Filter *.txt -Recurse | Select-String "word" | Select -Expand Matches
