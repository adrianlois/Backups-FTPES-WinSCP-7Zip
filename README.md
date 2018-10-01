# Automatizar-Backups-FTPES-Batchfile
Batchfile - Automatizar Backups FTPES con WinSCP, 7zip

- Se comprimen los datos
- Se envía el fichero comprimido a un servidor FTP de modo seguro
- Se genera un único log de las acciones
- Se envía el log por correo vía Gmail
- Se eliminan los temporales creados en el proceso

recursos: Es necesario establecer como variables de entorno del sistema Windows los binarios: WinSCP.com y 7z.exe

- backup.bat: establecer los valores deseados en las variables

-- set passwd7z=passwd7z

-- set pathTempFichero7z="pathTempFichero7z"

-- set pathLocalDatos="pathLocalDatos"

-- set pathRemotoFTP=pathRemotoFTP

-- set usuarioFTP=usuarioFTP

-- set passwdFTP=passwdFTP

-- set servidorFTP=servidorFTP

- envio_log_email.ps1: establecer los valores deseados en las variables


-- $usuarioEmail = "usuarioEmail@gmail.com" 

-- $passwdEmail = "passwdEmail"

-- $asuntoEmail = "asuntoEmail"

-- $cuerpoEmail = "cuerpoEmail"

Más info: https://www.zonasystem.com/2017/07/automatizar-copias-de-seguridad-ftps-winscp-taskschd.html
