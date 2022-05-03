#This is the setup file for the Game launcher. It uses test-path to check for default install paths and prompts the user for the install path if it is not the default
#Created by disk5464
#################################
#Set a variable to get our current locaiton
$Location = Get-Location

#Test if the default file paths are correct. This will return true if the program is installed in the default path and false if not
$testBattleNet = Test-Path -Path "C:\Program Files (x86)\Battle.net\Battle.net Launcher.exe" -PathType Leaf
$testEpic = Test-Path -Path "C:\Program Files (x86)\Epic Games\Launcher\Portal\Binaries\Win32\EpicGamesLauncher.exe" -PathType Leaf
$testSteam = Test-Path -Path "C:\Program Files (x86)\Steam\steam.exe" -PathType Leaf
$EaPath = Test-Path -Path "C:\Program Files\Electronic Arts\EA Desktop\EA Desktop\EALauncher.exe" -PathType Leaf
#################################
#If one or more of the programs are not in the default locaiton this will ask the user for the correct path
If($testBattleNet -eq $false)
{
    $NewBattlenetPath = Read-Host -Prompt "BattleNet Launcher not found. Please enter path to exe. (Default is C:\Program Files (x86)\Battle.net\Battle.net Launcher.exe). Enter N if you do not have it installed"
    if($NewBattlenetPath -ne "n" -and $NewBattlenetPath -ne "N")
    {
        #This gets the content of the main script and does a find and replace on the sting that has the default install path. Then saves the main script.
        (Get-Content ./StartGameLaunchers.ps1).replace('C:\Program Files (x86)\Battle.net\Battle.net Launcher.exe' , $NewBattlenetPath) | Set-Content -Path "$location\StartGameLaunchers.ps1"
    }
}
else
{
    Write-Host "BattlenNet install is set correctly" -ForegroundColor Green
}

If($testEpic -eq $false)
{
    $NewEpicpath = Read-Host -Prompt "Epic Games Launcher not found. Please enter path to exe. (Default is C:\Program Files (x86)\Epic Games\Launcher\Portal\Binaries\Win32\EpicGamesLauncher.exe) Enter N if you do not have it installed"
    if($NewEpicpath -ne "n" -and $NewEpicpath -ne "N")
    {
        #This gets the content of the main script and does a find and replace on the sting that has the default install path. Then saves the main script.
        (Get-Content ./StartGameLaunchers.ps1).replace('C:\Program Files (x86)\Epic Games\Launcher\Portal\Binaries\Win32\EpicGamesLauncher.exe', $NewEpicpath) | Set-Content -Path "$location\StartGameLaunchers.ps1"
    }
}
else
{
    Write-Host "Epic Games Launcher set correctly" -ForegroundColor Green
}

If($testSteam -eq $false)
{
    $NewSteamPath = Read-Host -Prompt "Steam not found. Please enter path to exe. (Default is C:\Program Files (x86)\Steam\steam.exe)"
    if($NewSteamPath -ne "n" -and $NewSteamPath -ne "N")
    {
        #This gets the content of the main script and does a find and replace on the sting that has the default install path. Then saves the main script.
        (Get-Content ./StartGameLaunchers.ps1).replace('C:\Program Files (x86)\Steam\steam.exe', $NewSteamPath) | Set-Content -Path "$location\StartGameLaunchers.ps1"
    }
}
else
{
    Write-Host "Steam set correctly" -ForegroundColor Green
}

If($EaPath -eq $false)
{
    $NewSteamPath = Read-Host -Prompt "Ea Play not found. Please enter path to exe. (Default is C:\Program Files\Electronic Arts\EA Desktop\EA Desktop\EALauncher.exe)"
    if($NewSteamPath -ne "n" -and $NewSteamPath -ne "N")
    {
        #This gets the content of the main script and does a find and replace on the sting that has the default install path. Then saves the main script.
        (Get-Content ./StartGameLaunchers.ps1).replace('C:\Program Files\Electronic Arts\EA Desktop\EA Desktop\EALauncher.exe', $NewSteamPath) | Set-Content -Path "$location\StartGameLaunchers.ps1"
    }
}
else
{
    Write-Host "EA Play set correctly" -ForegroundColor Green
}
#################################
Write-Host "Congrats! All filepaths have been set." -ForegroundColor Green
