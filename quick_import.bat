@echo off
set sendto=%APPDATA%\Microsoft\Windows\SendTo
for %%i in ("*.bat" "*.vbs" "*.py") do (
    if not "%%~nxi" == "%~nx0" (
        echo %%~nxi
        copy "%%i" "%sendto%" > nul
    )
)
pause
start shell:sendto
