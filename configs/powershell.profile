Import-Module PSColor
Import-Module PSReadLine
Import-Module posh-dotnet
Import-Module posh-alias
Import-Module PoShWarp
#Import-Module PSUtil
#Write-Host "Imported psutil"

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -HistorySearchCursorMovesToEnd -ShowToolTips

function Get-BackOneLevel { cd .. }
Set-Alias .. Get-BackOneLevel -Option AllScope

function Elevate-Process {
    Start-Process -Verb RunAs -FilePath "pwsh" -ArgumentList (@("-NoExit", "-Command") + $args)
}
Set-Alias sudo Elevate-Process

Invoke-Expression (&starship init powershell)