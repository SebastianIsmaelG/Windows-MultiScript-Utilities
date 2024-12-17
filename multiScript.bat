@echo off
:: Habilitar expansión retardada de variables
setlocal enabledelayedexpansion

:menu
cls
echo ---------- Menu MultiScript ----------
echo Selecciona el script que deseas ejecutar
echo 1 : Activar windows/Office clave KMS
echo 2 : Activar WinRaR clave estudiante
echo 3 : Devolver el menu contextual de windows 10 (Solo para windows 11 o superior)
echo 4 : Desactivar la busqueda de Bing en el menu inicio

echo 0 : Salir
echo --------------------------------------
:menu
set /p option=Selecciona una opcion: 

if "%option%"=="1" (
    powershell -Command "irm https://get.activated.win | iex"
    echo Activacion exitosa
    pause
    goto menu
) else if "%option%"=="2" (
    set ruta_destino="C:\Program Files\Common Files"
    (       
            echo RAR registration data
            echo Federal Agency for Education
            echo 1000000 PC usage license
            echo UID=b621cca9a84bc5deffbf
            echo 6412612250ffbf533df6db2dfe8ccc3aae5362c06d54762105357d
            echo 5e3b1489e751c76bf6e0640001014be50a52303fed29664b074145
            echo 7e567d04159ad8defc3fb6edf32831fd1966f72c21c0c53c02fbbb
            echo 2f91cfca671d9c482b11b8ac3281cb21378e85606494da349941fa
            echo e9ee328f12dc73e90b6356b921fbfb8522d6562a6a4b97e8ef6c9f
            echo fb866be1e3826b5aa126a4d2bfe9336ad63003fc0e71c307fc2c60
            echo 64416495d4c55a0cc82d402110498da970812063934815d81470829275
    ) > "%CD%\rarreg.key"
       if exist "%CD%\rarreg.key" (
        xcopy "%CD%\rarreg.key" !ruta_destino! /H /R /Y  ahora aqui tiene que copiar al winrar directorio
        
        ) else (
            echo No se pudo copiar el archivo. Ejecute como administrador y reintente
        )
    pause
    goto menu
) else if "%option%"=="3" (
    reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
    taskkill -IM explorer.exe -f
    explorer.exe
    echo Se ha devuelto el menú contextual con exito
    pause
    goto menu
) else (
    echo Opcion no valida. Por favor, selecciona una opción valida.
    pause
    goto menu
)

