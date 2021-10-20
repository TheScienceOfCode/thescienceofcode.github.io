. $PSScriptRoot/_EquilaterusCLI.ps1

Function Invoke-Script {
    git submodule update --remote --merge
}

Start-Cli -Title 'Update theme' -Filename 'config.toml'
