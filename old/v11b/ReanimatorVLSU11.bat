@echo off
mode con:cols=80 lines=50
set stage=0
:logo
echo. __      ___       _____ _    _         __          ______  _____  __  __ 
echo. \ \    / / ^|     / ____^| ^|  ^| ^|        \ \        / / __ \^|  __ \^|  \/  ^|
echo.  \ \  / /^| ^|    ^| (___ ^| ^|  ^| ^|         \ \  /\  / / ^|  ^| ^| ^|__) ^| \  / ^|
echo.   \ \/ / ^| ^|     \___ \^| ^|  ^| ^|          \ \/  \/ /^| ^|  ^| ^|  _  /^| ^|\/^| ^|
echo.    \  /  ^| ^|____ ____) ^| ^|__^| ^|           \  /\  / ^| ^|__^| ^| ^| \ \^| ^|  ^| ^|
echo.  ___\/  _^|______^|_____/ \____/_____ __  __ \/  \/  _\____/^|_^|__\_\_^|__^|_^|
echo. ^|  __ \^|  ____^|   /\   ^| \ ^| ^|_   _^|  \/  ^|    /\ ^|__   __^|/ __ \^|  __ \ 
echo. ^| ^|__) ^| ^|__     /  \  ^|  \^| ^| ^| ^| ^| \  / ^|   /  \   ^| ^|  ^| ^|  ^| ^| ^|__) ^|
echo. ^|  _  /^|  __^|   / /\ \ ^| . ` ^| ^| ^| ^| ^|\/^| ^|  / /\ \  ^| ^|  ^| ^|  ^| ^|  _  / 
echo. ^| ^| \ \^| ^|____ / ____ \^| ^|\  ^|_^| ^|_^| ^|  ^| ^| / ____ \ ^| ^|  ^| ^|__^| ^| ^| \ \ 
echo. ^|_^|  \_\______/_/    \_\_^| \_^|_____^|_^|  ^|_^|/_/    \_\^| ^|   \____/^|_^|  \_\
echo.   ___         ______           __           __ _____ 
echo.  / _ )__ __  / __/ /  ___ ____/ /__ _    __/ // / _ \ v1.1b
echo. / _  / // / _\ \/ _ \/ _ `/ _  / _ \ ^|/^|/ / _  / // /
echo./____/\_, / /___/_//_/\_,_/\_,_/\___/__,__/_//_/____/ 
echo.     /___/ http://ShadowHD.ru
echo.
goto stage%stage%

:stage0
::admin check
if "%cd%" NEQ "%windir%\system32" (
	color 0C
	echo.--^>����饭�� �� �� ����� �����������!
	echo.--^>��������, ��१������ �⨫��� �� ����� �����������.
	echo.
	pause
	exit
)

color 0A
echo.�� �⨫�� ������� ��� 㤠���� ����� � �������� � ���������� ��� ��
echo.��᫥���饣� ��ࠦ����.
echo.
echo.�᫨ �� �� �����, ��� ���짮������ ����஬ ॠ������, ���⠩� ReadMe.txt
echo.
echo.��� ��室� �� �ணࠬ�� �ᯮ���� Ctrl+C
echo.
pause

set stage=1
cls
goto logo
:stage1
echo.���� ࠡ�� �� 㤠����� ����� �� ��⥬� � ��⠭���� ����� �� ����.
echo.��������, ��������.
echo.
echo.1. �����襭�� ����� ��� ����� vlsu0001...

::wscript killing
TASKKILL /F /T /IM wscript.exe > nul ^|^| (
echo.����� ����� vlsu.0001 �� �� �����㦥�
goto stage2
)
echo.	�ᯥ譮!

:stage2
::WSH Closed
echo.
echo.2. ����� �� ����� Windows Script Host...
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Script Host\Settings" /v Enabled /t REG_DWORD /d 0 /f >nul ^|^| (
echo.�������� �訡��! ��筮 ᮮ��� � ��� ࠧࠡ��稪�!
goto stage3
)
echo.	�ᯥ譮!

:stage3
::Kill Autorun
echo.
echo.3. �������� ᯨ᪮� ��⮧���᪠...

echo.----�������� ����饭�� � ॥���...
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v notepad /f >nul && echo.�ᯥ譮 㤠���� ^|^| (
echo.����饭�� �� �����㦥��
)
echo.

echo.----�������� ����c���� 䠩��
rmdir /s /q "%appdata%\notepad" >nul && echo.�ᯥ譮 㤠���� ^|^| (
echo.���� �� �����㦥�.
)
echo.

echo.----�������� ��뫪� �� ���� �� ��⮧���᪠
del /f /q "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\notepad.lnk" && echo.�ᯥ譮 㤠����
echo.

echo.����⠭������� ��⥬� �ᯥ譮 �믮�����!
echo.�᫨ �� �� �०���� ����砥� ��᫥��⢨� �����, ᮮ��� ࠧࠡ��稪�: ShadowHD.ru
echo.
pause
