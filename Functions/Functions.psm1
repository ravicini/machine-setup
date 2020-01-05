Add-Type -AssemblyName System.IO.Compression.FileSystem

function Add-EnvPath {
    param(
        [Parameter(Mandatory=$true)]
        [string] $Path,

        [ValidateSet('Machine', 'User', 'Session')]
        [string] $Container = 'Session'
    )

    if ($Container -ne 'Session') {
        $containerMapping = @{
            Machine = [EnvironmentVariableTarget]::Machine
            User = [EnvironmentVariableTarget]::User
        }
        $containerType = $containerMapping[$Container]

        $persistedPaths = [Environment]::GetEnvironmentVariable('Path', $containerType) -split ';'
        if ($persistedPaths -notcontains $Path) {
            $persistedPaths = $persistedPaths + $Path | Where-Object { $_ }
            [Environment]::SetEnvironmentVariable('Path', $persistedPaths -join ';', $containerType)
        }
    }

    $envPaths = $env:Path -split ';'
    if ($envPaths -notcontains $Path) {
        $envPaths = $envPaths + $Path | Where-Object { $_ }
        $env:Path = $envPaths -join ';'
    }
}

function Install-AppGet {
    param (
        [Parameter(Mandatory)]
        [string] $file
    )

    foreach($line in Get-Content $file) {
        appget install $line
    }
}

function Install-Choco {
    param (
        [Parameter(Mandatory)]
        [string] $file
    )
    
    foreach($line in Get-Content $file) {
        choco install $line -y
    }
}

Export-ModuleMember -Function Add-EnvPath
Export-ModuleMember -Function Install-Choco
Export-ModuleMember -Function Install-AppGet
Export-ModuleMember -Function Download-File