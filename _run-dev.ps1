cd .\themes\tranquilpeak
invoke-expression 'cmd /c start powershell -Command { npm run start }'
cd..
cd..
hugo server -w --noHTTPCache --disableFastRender -v
