@echo off
echo Creating new theme file...
copy "C:\Windows\Resources\Themes\aero.theme" "C:\Windows\Resources\Themes\aero-dark.theme"
echo Modifying theme file...
powershell -Command "(gc C:\Windows\Resources\Themes\aero-dark.theme) -replace 'DisplayName=Aero', 'DisplayName=Aero Dark' | Out-File C:\Windows\Resources\Themes\aero-dark.theme"
echo Applying theme...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\CurrentTheme" /v "Default" /d "C:\Windows\Resources\Themes\aero-dark.theme" /f
echo Done!
pause
