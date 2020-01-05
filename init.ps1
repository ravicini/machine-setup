Import-Module .\Functions\Functions.psm1 -Force

$appget = "https://dl.appget.net/appget/appget.setup.exe"
$optDir = "C:\opt"

if (-not(Test-Path -Path $optDir)) {
    New-Item -ItemType "directory" -Path $optDir    
}

function InstallAppGet {
    Invoke-WebRequest -Uri $appget -OutFile "appget.setup.exe"
    Start-Process appget.setup.exe
    Add-EnvPath "C:\ProgramData\AppGet\bin" "Machine"
    Remove-Item .\appget.setup.exe    
}

function InstallChocolatey {
    Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
}

function InstallStarship {
    $starshipLatest = "https://github.com/starship/starship/releases/latest/download/starship-x86_64-pc-windows-msvc.zip"
    $starshipZip = ".\starship.zip"
    Invoke-WebRequest -Uri $starshipLatest -OutFile $starshipZip
    Expand-Archive $starshipZip -DestinationPath "$optDir\starship" -Force
    Add-EnvPath "$optDir\starship" "Machine"
}

Set-ExecutionPolicy Bypass -Scope Process -Force
InstallAppGet
InstallChocolatey
InstallStarship