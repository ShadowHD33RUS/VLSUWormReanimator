@echo off
mode con:cols=80 lines=50
:logo
echo. __      ___       _____ _    _     __          ______  _____  __  __ 
echo. \ \    / / ^|     / ____^| ^|  ^| ^|    \ \        / / __ \^|  __ \^|  \/  ^|
echo.  \ \  / /^| ^|    ^| (___ ^| ^|  ^| ^|     \ \  /\  / / ^|  ^| ^| ^|__) ^| \  / ^|
echo.   \ \/ / ^| ^|     \___ \^| ^|  ^| ^|      \ \/  \/ /^| ^|  ^| ^|  _  /^| ^|\/^| ^|
echo.    \  /  ^| ^|____ ____) ^| ^|__^| ^|       \  /\  / ^| ^|__^| ^| ^| \ \^| ^|  ^| ^|
echo.   __\/_  ^|______^|_____/_\____/         \/  \/  _\____/^|_^|_ \_\_^|__^|_^|
echo.  / ____^|  ^| ^|       ^|  ____^|      /\      ^| \ ^| ^|  ^|  ____^|  ^|  __ \
echo. ^| ^|       ^| ^|version^| ^|__        /  \     ^|  \^| ^|  ^| ^|__     ^| ^|__) ^|
echo. ^| ^|       ^| ^|  1.0  ^|  __^|      / /\ \    ^| . ` ^|  ^|  __^|    ^|  _  / 
echo. ^| ^|____   ^| ^|____   ^| ^|____    / ____ \   ^| ^|\  ^|  ^| ^|____   ^| ^| \ \ 
echo.  \_____^|  ^|______^|  ^|______^|  /_/    \_\  ^|_^| \_^|  ^|______^|  ^|_^|  \_\
echo.   ___         ______           __           __ _____ 
echo.  / _ )__ __  / __/ /  ___ ____/ /__ _    __/ // / _ \
echo. / _  / // / _\ \/ _ \/ _ `/ _  / _ \ ^|/^|/ / _  / // /
echo./____/\_, / /___/_//_/\_,_/\_,_/\___/__,__/_//_/____/ 
echo.     /___/ http://ShadowHD.ru
echo.
goto stage%stage%
:stage
set stage=0

::���� ����᭮�� �����.
TaskList /FI "ImageName EQ wscript.exe" 2>nul|Find /I "wscript.exe">nul || goto stage0
color 0C
echo.����᪠� �訡��! �� �����㦥� ������ �����!
echo.����� �⨫��� �㤥� �����襭�.
echo.��� 㤠����� ����� �� ��⥬� �ᯮ���� ReanimatorVLSUxx.bat
echo.
goto exit

:stage0
::admin check
if "%cd%" NEQ "%windir%\system32" (
	color 0C
	echo.--^>����饭�� �� �� ����� �����������!
	echo.--^>��������, ��१������ �⨫��� �� ����� �����������.
	echo.
	goto exit
)

color 0A
echo.�� �⨫�� ������� ��� ������� 䫥�� �� ����� � ����⠭����� 䠩��.
echo.
echo.��������, �� �� ����᪠ CleanerVLSU �� �����⨫� � �ᯥ譮 �믮����� 䠩�
echo.ReanimatorVLSU.bat.
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
echo.������ ��� 䫥誨, ������ �ॡ���� ����⠭����� (㪠��� ⮫쪮 �㪢� ��᪠).
echo.��� �����⥫�� � �� 㪠��� �㪢� ��襣� ���⪮�� ��᪠!
set /p flashname=
cd /d %flashname%:\
if "%cd%" NEQ "%flashname%:\" (
	color 0C
	echo.--^>�� �� ��୮ 㪠���� ��� ��᪠.
	echo.--^>��������, �ᯮ���� ⮫쪮 ��⨭��� � ������ ⮫쪮 ���� �㪢�.
	echo.
	goto exit
)

:stage2
echo.	�ᯥ譮!
echo.
echo.�������� ����� � 䫥誨.
del /f /q notepad.vbe
echo.	�ᯥ譮!

:stage3
echo.
echo.�������� ��몮� � 䫥誨.
del /f /q *.lnk
echo.	�ᯥ譮!

:stage4
echo.
echo.��������� ��ਡ�⮢ 䠩���. (����� ������ ��᪮�쪮 �����, ����)
attrib -s -h -r -a /s /d *.*
echo.	�ᯥ譮!

echo.
echo.����⠭������� 䫥誨 �ᯥ譮 �믮�����!
echo.�᫨ �� �� �०���� ����砥� ��᫥��⢨� �����, ᮮ��� ࠧࠡ��稪�.
echo.

:exit
pause