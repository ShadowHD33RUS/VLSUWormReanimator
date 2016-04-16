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
	echo.--^>Запущенно не от имени администратора!
	echo.--^>Пожалуйста, перезапустите утилиту от имени администратора.
	echo.
	pause
	exit
)

color 0A
echo.Эта утилита поможет Вам удалить вирус с компьютера и обезопасить его от
echo.последующего заражения.
echo.
echo.Если Вы не знаете, как пользоваться набором реаниматора, прочитайте ReadMe.txt
echo.
echo.Для выхода из программы используйте Ctrl+C
echo.
pause

set stage=1
cls
goto logo
:stage1
echo.Начата работа по удалению вируса из системы и установке защиты от него.
echo.Пожалуйста, подождите.
echo.
echo.1. Завершение процесса для вируса vlsu0001...

::wscript killing
TASKKILL /F /T /IM wscript.exe > nul ^|^| (
echo.Процесс вируса vlsu.0001 не был обнаружен
goto stage2
)
echo.	Успешно!

:stage2
::WSH Closed
echo.
echo.2. Запрет на запуск Windows Script Host...
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Script Host\Settings" /v Enabled /t REG_DWORD /d 0 /f >nul ^|^| (
echo.Возникла ошибка! Срочно сообщите о ней разработчику!
goto stage3
)
echo.	Успешно!

:stage3
::Kill Autorun
echo.
echo.3. Удаление списков автозапуска...

echo.----Удаление замещения в реестре...
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v notepad /f >nul && echo.Успешно удалено ^|^| (
echo.Замещение не обнаружено
)
echo.

echo.----Удаление вируcного файла
rmdir /s /q "%appdata%\notepad" >nul && echo.Успешно удалено ^|^| (
echo.Файл не обнаружен.
)
echo.

echo.----Удаление ссылки на него из автозапуска
del /f /q "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\notepad.lnk" && echo.Успешно удалено
echo.

echo.Восстановление системы успешно выполнено!
echo.Если Вы по прежнему замечаете последствия вируса, сообщите разработчику: ShadowHD.ru
echo.
pause
