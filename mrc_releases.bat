@ECHO OFF
CD /d %~dp0
:CHOICE
ECHO.
ECHO 1 - ������һ���ļ�
ECHO 2 - Trime ͬ�����뷨 Android
ECHO 3 - Weasel С�Ǻ����뷨 Windows
ECHO 4 - �˳�
ECHO.
CHOICE /C:1234 /N
IF errorlevel 4 EXIT
IF errorlevel 3 goto THREE
IF errorlevel 2 goto TWO
IF errorlevel 1 goto ONE


:ONE
xcopy .\basic .\release\ /E
xcopy .\schema .\release\ /E
xcopy .\ex_dict .\release\ /E
xcopy .\custom .\release\ /E
7z a release.zip .\release
goto end

:TWO
xcopy .\theme\trime .\release\ /E
goto ONE

:THREE
xcopy .\theme\weasel.custom.yaml .\release\ /E
goto  ONE

:end
echo ���,�밴������˳�
pause >nul