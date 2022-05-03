Welcome to the Game Launcher Launcher!
######################################
Last Modified 5/2/22
######################################
Description:
By running the GamesLauncherBat.bat file you will be able to launch all of your game launcher / storefronts at once. Right now, it launches Steam, BattleNet, Epic Games, EA play, and the MS store but more can be added. The reason I wrote this is that I noticed my BattleNet doesn’t start on launch (I don't use it very often so I have AutoStart disabled) and would leave my games out of date, meaning I'd have to do a bunch of updates if I wanted to play something on BattleNet. 
######################################
How to use: 
The first time you want to use this run the Setup.bat first. This will check to see if your launchers are installed in the default locations. If not, it will ask you for the file path to the exe. After this you can just run the GameLauncherBat.bat If you want to run the GameLauncherBat.bat from somewhere else besides this directory, right click on it, hit "send to", then "Desktop (create shortcut)". This will create a shortcut on your desktop that you can put anywhere.
######################################
How it works:
Both .bat files simply point to the scripts that are in the scripts folder.

The Setup.ps1 first tests to see if the exe's exist using Test-Path. These statements return true or false. True if the file exists, false if it does not. If it returns false we know the user installed the program somewhere besides the default location, this is where the If($testBattleNet -eq $false) comes into play. When triggered it asks the user for the file path. The script then uses the next line (Get-Content ./StartGameLaunchers.ps1).replace blah blah blah to rewrite the start paths in the StartGameLaunchers.ps1. I could have put this all-in-one script but then each time the user would want to run the main script they would have to redefine where the exes are.

The StartGameLaunchers.ps1 is much simpler. It simply uses a bunch of Start-Process' to start the programs.
