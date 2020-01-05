param(
    [Parameter(Mandatory)]
    [ValidateSet('dev', 'game')]
    [string]
    $environment
)

Import-Module .\Functions\Functions.psm1 -Force

Install-AppGet .\install-lists\common.appget
Install-Choco .\install-lists\common.choco

switch ($environment)
{
    'dev' {
        Install-AppGet .\install-lists\dev.appget
        Install-Choco .\install-lists\dev.choco
    }
    'game' {
        Install-AppGet .\install-lists\game.appget
    }
}

