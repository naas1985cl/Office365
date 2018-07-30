$username = "Cuenta_de_usuario"
$password = "Ingresar_Password_Aca"
$secureStringPwd = $password | ConvertTo-SecureString -AsPlainText -Force 
$Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $secureStringPwd
Connect-AzureAD -Credential $Credentials
Connect-MsolService -Credential $Credentials
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $Credentials -Authentication Basic -AllowRedirection
Import-PSSession $Session