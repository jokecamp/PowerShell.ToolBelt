<#
    Learning Aid - a showcase of very simple examples of useful tasks to perform
    via powershell. Helpful for those learning powershell

#>

# Sending an email
$smtp = new-object Net.Mail.SmtpClient('mail.test.org') 
$smtp.Send('from@test.org', 'to@test.org', 'Subject', 'body') 

