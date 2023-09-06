# Active Directory should be install with DNS service 

Write-Host "Installing DNS and Active Directory services"
Install-WindowsFeature -Name DNS, AD-Domain-Services -IncludeManagementTools

$DomainName = Read-Host "Input Domain Name"

# If your domain name is example.com --> you need use EXAMPLE for NetBiosName
$DomainNetBiosName = Read-Host "Input NetBios name"

$DatabasePath = "C:\Windows\NTDS"
$LogPath = "C:\Windows\NTDS\Logs_AD"
$SysvolPath = "C:\Windows\SYSVOL"
$ADMode = "WinThreshold"

$ForestConfig = @{
    DomainName = $DomainName 
    DomainNetBiosName = $DomainNetBiosName 
    DatabasePath = $DatabasePath 
    LogPath = $LogPath 
    SysvolPath = $SysvolPath 
    DomainMode = $ADMode 
    ForestMode = $ADMode 
    InstallDNS = $true 
    Force = $true 
    CreateDnsDelegation = $false 
    NoRebootOnCompletion = $false
}

Write-Host "Starting AD configure"

Install-ADDSForest @ForestConfig
