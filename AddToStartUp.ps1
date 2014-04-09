Function AddToStartup($location, $name)
{

    $u = [Environment]::UserName
    $startup = "C:\Users\" + $u + "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\" + $name + ".lnk"

    $short = New-Object -ComObject WScript.Shell
    $sh = $short.CreateShortcut($startup)
    $sh.TargetPath = $location
    $sh.Save()

}

AddToStartup -location "C:\Program Files (x86)\Program\Program.exe" -name "prog"