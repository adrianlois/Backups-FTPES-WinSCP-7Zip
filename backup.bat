@echo off
rem Autor @adrianlois_
title Backups by @adrianlois_

:: Fecha y Hora
set ano=%date:~6,4%
set mes=%date:~3,2%
set dia=%date:~0,2%
set hora=%time:~0,8%
set backuplog=backup_%dia%-%mes%-%ano%.log
set backupzip=Backup_%dia%-%mes%-%ano%.zip

:: Credenciales y Paths
set passwd7z=passwd7z
set pathTempFichero7z="pathTempFichero7z%backupzip%"
set pathLocalDatos="pathLocalDatos"
set pathRemotoFTP=pathRemotoFTP
set usuarioFTP=usuarioFTP
set passwdFTP=passwdFTP
set servidorFTP=servidorFTP
set conexionFTP=ftp://%usuarioFTP%:%passwdFTP%@%servidorFTP%
set fingerprintSSLFTP="xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx"

:: Comprobar si existen ficheros de log pasados del backup.
if exist "*backup*.log" ( del /F /Q "*backup*.log" )

:: Mostrar fecha y hora del comienzo del proceso de backup al princpio del log.
echo El backup comienza: %dia%-%mes%-%ano% - %hora% > %backuplog%
echo. >> %backuplog%
echo # # # # # # # # # # # # # # # # # # # # >> %backuplog%

:: Comprimir datos, generar log zip, agregarlo al backup log final y mostrar una línea de separación.
:: En caso de excluir directorios y ficheros añadir a la línea de 7z el parámetro -xr!"<directorio_fichero>" tantas veces como elementos a excluir de la compresión.
7z a -tzip -p%passwd7z% -r %pathTempFichero7z% %pathLocalDatos% > zip%backuplog%

type zip%backuplog% >> %backuplog%
echo. >> %backuplog%
echo # # # # # # # # # # # # # # # # # # # # >> %backuplog%

:: Subir el fichero comprimido al servidor FTP, generar log FTP, añadirlo al log de backup y mostrar una línea de separación.
winscp.com /log="ftp%backuplog%" /loglevel=2 /command "open %conexionFTP% -explicit -certificate=%fingerprintSSLFTP%" "cd %pathRemotoFTP%" "rm Backup*.zip" "put %pathTempFichero7z%" "close" "exit"

type ftp%backuplog% >> %backuplog%
echo. >> %backuplog%
echo # # # # # # # # # # # # # # # # # # # # >> %backuplog%

:: Eliminar ficheros temporales: logs y fichero temporal backup zip.
del /F /Q "zip*.log"
del /F /Q "ftp*.log"
del /F /Q %pathTempFichero7z%

:: Comprobar la eliminación de ficheros de log y fichero temporal backup zip, insertar el resultado en el log.
:: Log de la compresión zip.
if exist "zip*.log" (
	echo -- zip%backuplog% no se eliminó correctamente >> %backuplog%
	) else (
	   echo -- zip%backuplog% se eliminó correctamente >> %backuplog%
	)
:: Log del envío de datos al servidor FTP.
if exist "ftp*.log" (
	echo -- ftp%backuplog% no se eliminó correctamente >> %backuplog%
	) else (
	   echo -- ftp%backuplog% se eliminó correctamente >> %backuplog%
	)
:: Fichero temporal backup zip
if exist "D:\Backup*.zip" (
	echo -- %backupzip% no se eliminó correctamente >> %backuplog%
	) else (
	   echo -- %backupzip% se eliminó correctamente >> %backuplog%
	)

echo. >> %backuplog%
echo # # # # # # # # # # # # # # # # # # # # >> %backuplog%
:: Mostrar fecha y hora de la finalización del proceso de backup al final del log.
:: Se resetea la variable hora para obtener la hora actual hasta este momento del proceso de backup.
set hora=%time:~0,8%
echo El backup finaliza: %dia%-%mes%-%ano% - %hora% >> %backuplog%

:: Llamada al script Powershell para el envío del log vía Email.
powershell.exe -file "envio_log_email.ps1"
