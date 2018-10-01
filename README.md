# Automatizar-Backups-FTPES-Batchfile
Batchfile - Automatizar Backups FTPES con WinSCP y 7zip (2017)

Más info: https://www.zonasystem.com/2017/07/automatizar-copias-de-seguridad-ftps-winscp-taskschd.html

> **recursos**: Es necesario establecer como variables de entorno del sistema Windows los binarios: WinSCP.com y 7z.exe

## Procedimientos
1. Se establecen las variables
2. Se comprimen los datos en un único fichero comprimido temporal
3. Se envía el fichero comprimido a un servidor FTP de modo seguro
4. Se genera un único log de las acciones realizadas
5. Se envía el log por correo vía Gmail
6. Se eliminan los temporales creados en el proceso

### Envío log cuenta Gmail (Google)
Para el envío del log vía Gmail es necesario activar el acceso a "Aplicaciones menos seguras" en la cuenta Google. 
https://myaccount.google.com/lesssecureapps

![Aplicaciones menos seguras Google](https://raw.githubusercontent.com/adrianlois/Automatizar-Backups-FTPES-Batchfile/master/screenshots-test/ejecucion_app_menos_seguras_gmail.png)

> **backup.bat**: establecer los valores deseados en las variables

- set passwd7z=passwd7z
- set pathTempFichero7z="pathTempFichero7z"
- set pathLocalDatos="pathLocalDatos"
- set pathRemotoFTP=pathRemotoFTP
- set usuarioFTP=usuarioFTP
- set passwdFTP=passwdFTP
- set servidorFTP=servidorFTP

> **envio_log_email.ps1**: establecer los valores deseados en las variables

- $usuarioEmail = "usuarioEmail@gmail.com" 
- $passwdEmail = "passwdEmail"
- $asuntoEmail = "asuntoEmail"
- $cuerpoEmail = "cuerpoEmail"
