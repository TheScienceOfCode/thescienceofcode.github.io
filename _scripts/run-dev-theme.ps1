. $PSScriptRoot/_EquilaterusCLI.ps1

Function Invoke-Script {
    Set-Location '.\themes\tranquilpeak'
    npm run start
}

Start-Cli -Title 'Run Theme' -Filename 'config.toml'
