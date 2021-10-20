. $PSScriptRoot/_EquilaterusCLI.ps1

Function Invoke-Script {
    hugo server -w --noHTTPCache --disableFastRender -v
}

Start-Cli -Title 'Run Hugo' -Filename 'config.toml'
