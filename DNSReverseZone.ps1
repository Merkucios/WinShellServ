# DNS primary zone is creating automatically in WIN 2016-2022 
    # Add-DnsServerPrimaryZone -Name "example.com" -ReplicationScope "Forest" -PassThru

# Also u can display all zones that have already been added command:
    # Get-DNSServerZone

Write-Host "Enter your IP-network with mask"
Write-Host "  Example: 192.168.1.0/24 | 61.40.0.0/16"
$StaticNetworkIP = Read-Host
$ServerIPAddress = Read-Host "Input Server IPv4 Address"
$HostWithoutDomain = hostname


$IPComponents = $StaticNetworkIP.Split('.')

$ZoneName = "$($IPComponents[2]).$($IPComponents[1]).$($IPComponents[0]).in-addr.arpa"
$Hostname = (Resolve-DnsName -Type PTR -Name $ServerIPAddress).NameHost.ToLower()

# Adding reverse lookup zone
Add-DnsServerPrimaryZone -NetworkID $StaticNetworkIP -ReplicationScope "Forest"
# Add-DnsServerResourceRecordPtr -Name $HostWithoutDomain -ZoneName $ZoneName -PtrDomainName $HostName -AllowUpdateAny -TimeToLive 01:00:00

# Now you're going to check nslookup service
#   if you have problem that default server = "Unknown":
#       1. Check your IPv6 settings in network adapter 
#       2. Do command ipconfig /flushdns
#       3. Check your PTR record in reverse zone
# Add-DnsServerResourceRecordPtr -ZoneName "<zonename>" -PtrDomainName "<hostname>" -IPv4Address "<ipaddress>"