$username = ""   #service principal app id
$secret=""   # service principal plain test secret.
$tenantId=""

$password = ConvertTo-SecureString $secret -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $password
Connect-AzAccount -ServicePrincipal -Credential $cred -Tenant $tenantId
Get-AzContext
