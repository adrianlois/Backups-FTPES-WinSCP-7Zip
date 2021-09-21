# Backups-FTPES-WinSCP-7Zip
Batchfile - Automatizar Backups FTPES con WinSCP y 7zip (2017)

Más info: https://www.zonasystem.com/2017/07/automatizar-copias-de-seguridad-ftps-winscp-taskschd.html

> **recursos**: Es necesario establecer como variables de entorno del sistema Windows los binarios: WinSCP.com y 7z.exe.

## Procedimientos
1. Se establecen las variables
2. Se comprimen los datos en un único fichero comprimido temporal
3. Se envía el fichero comprimido a un servidor FTP explícito de modo seguro (*-explicit*)
4. Se genera un único log de las acciones realizadas
5. Se envía el log por correo vía Gmail
6. Se eliminan los temporales creados en el proceso

### Envío log cuenta Gmail (Google)
Para el envío del log vía Gmail es necesario activar el acceso a "Aplicaciones menos seguras" en la cuenta Google. Por seguridad, se debería crear una cuenta específica para esta finalidad.
https://myaccount.google.com/lesssecureapps

![Aplicaciones menos seguras Google](https://raw.githubusercontent.com/adrianlois/Automatizar-Backups-FTPES-Batchfile/master/screenshots-test/ejecucion_app_menos_seguras_gmail.png)

> **backup_ftpes.bat**: establecer los valores deseados en las variables. (Aunque se use 7z.exe el tipo de fichero será en formato zip protegido con una contraseña).

- set passwdZip=passwdZip
- set pathTempFicheroZip="pathTempFicheroZip"
- set pathLocalDatos="pathLocalDatos"
- set pathRemotoFTP=pathRemotoFTP
- set usuarioFTP=usuarioFTP
- set passwdFTP=passwdFTP
- set servidorFTP=servidorFTP
- set fingerprintSSLFTP="xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx"

> **envio_log_email.ps1**: establecer los valores deseados en las variables.

- $usuarioEmail = "usuarioEmail@gmail.com" 
- $passwdEmail = "passwdEmail"
- $asuntoEmail = "asuntoEmail"
- $cuerpoEmail = "cuerpoEmail"
