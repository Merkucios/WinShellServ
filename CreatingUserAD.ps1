Write-Host "Input account name"
Write-Host "Example: Jonh Samuel"
$Name = Read-Host

Write-Host "Input user login"
Write-Host "Example: jonhsamuel_job1"
$SamAccountName = Read-Host

$DomainName = "Input domain name"

$UserPrincipalName = $SamAccountName + "@" + $DomainName

# Look at Path parameter, insert your path to catalog with users , example:IT\tokargg.local
New-ADUser -Name $Name -SamAccountName $SamAccountName -UserPrincipalName $UserPrincipalName -Path "OU=IT” ,DC=tokargg,DC=local" -AccountPassword(Read-Host -AsSecureString "Input user password") -Enabled $true