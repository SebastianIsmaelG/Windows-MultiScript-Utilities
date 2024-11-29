@echo off
:menu
cls
echo ---------- Menu MultiScript ----------
echo Selecciona el script que deseas ejecutar
echo 1 : Activar windows clave KMS
echo 2 : Activar WinRaR clave estudiante
echo 3 : Devolver el menu contextual de windows 10 (Solo para windows 11 o superior)
echo 4 : Desactivar la busqueda de Bing en el menu inicio

echo 0 : Salir
echo --------------------------------------
set /p option=Select an option: 

if "%option%"=="1" (
  reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
  taskkill -IM explorer.exe -f
  explorer.exe
  echo "The old context menu (Windows 10) has been applied."
  pause
  goto menu
) else (
  echo Opción no válida. Por favor, selecciona una opción válida.
  pause
  goto menu
)

