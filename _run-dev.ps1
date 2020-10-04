cd .\themes\tranquilpeak
invoke-expression 'cmd /c start powershell -Command { npm run start }'
Read-Host -Prompt "Wait until npm start completes"
cd..
cd..
hugo server -w --noHTTPCache --disableFastRender -v
