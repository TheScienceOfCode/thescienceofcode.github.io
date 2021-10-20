invoke-expression 'cmd /c start powershell -Command { .\run-dev-theme.ps1 }'
Read-Host -Prompt "Wait until npm start completes... Then, press any key HERE to continue (or CTRL+C to exit)."
invoke-expression 'cmd /c start powershell -Command { .\run-dev-hugo.ps1 }'
