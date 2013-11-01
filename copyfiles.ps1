Test-Path C:\Folder\
## If false, make the directory

md C:\Folder\

Copy-Item -Path C:\Source -Destination C:\Folder -Recurse
## if needing only certain items (trcs) use filter (see below)


Copy-Item -Path C:\Source -Filter *.trc -Destination C:\Folder -Recurse
