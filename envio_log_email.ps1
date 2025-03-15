# Variables
$fechaHoraActual = Get-Date -Format "dd-MM-yyyy - HH:mm:ss"
$usuarioEmail = "usuarioEmail@gmail.com" 
$passwdEmail = "passwdEmail"
$asuntoEmail = "asuntoEmail"
$cuerpoEmail = "cuerpoEmail"
# Convertir password a un string seguro.
$secPasswdEmail = ConvertTo-SecureString $passwdEmail -AsPlainText -Force
$credencialesEmail = New-Object System.Management.Automation.PSCredential ($usuarioEmail, $secPasswdEMail)

# Envío del fichero log adjunto vía Email usando Gmail.
Send-MailMessage -From $usuarioEmail -To $usuarioEmail -Subject "$asuntoEmail - $fechaHoraActual" -Body "$cuerpoEmail - $fechaHoraActual" -Attachments "backup*.log" -SmtpServer smtp.gmail.com -UseSsl -Credential $credencialesEmail
exit