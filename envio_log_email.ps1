#####################
# Autor @adrianlois_
#####################

# Variables
$fechaHoraActual = Get-Date -uformat "%d/%m/%Y - %H:%M:%S"
$usuarioEmail = "usuarioEmail@gmail.com" 
$passwdEmail = "passwdEmail"
$asuntoEmail = "asuntoEmail"
$cuerpoEmail = "cuerpoEmail"
# Convertir password a un string seguro.
$secPasswdEmail = ConvertTo-SecureString $passwdEmail -AsPlainText -Force
$credencialesEmail = New-Object System.Management.Automation.PSCredential ($usuarioEmail, $secPasswdEMail)

# Enví­o del fichero log adjunto ví­a Email usando Gmail.
Send-MailMessage -From $usuarioEmail -To $usuarioEmail -Subject "$asuntoEmail - $fechaHoraActual" -Body "$cuerpoEmail - $fechaHoraActual" -Attachments "backup*.log" -SmtpServer smtp.gmail.com -UseSsl -Credential $credencialesEmail
exit