$vcFqdn = 'demo-m01-vc02.demo.local'
$vcUser = 'administrator@vsphere.local'
$vcPassword = '<Password>'
$ldapDomain = 'domain.local'
$ldapUser = 'user1'
$ssoDomain = 'vsphere.local'
$ssoGroup = 'administrators'

$ssoConnection = Connect-SsoAdminServer -Server $vcFqdn -User $vcUser -Password $vcPassword -SkipCertificateCheck
$targetGroup = Get-SsoGroup -Domain $ssoDomain -Name $ssoGroup -Server $ssoConnection
$ldapUserToAdd = Get-SsoPersonUser -Domain $ldapDomain -Name $ldapUser -Server $ssoConnection
$ldapUserToAdd | Add-UserToSsoGroup -TargetGroup $targetGroup




$administratosGroup = Get-SsoGroup -Name 'Administrators' -Domain 'vsphere.local'
Get-SsoPersonUser -Name 'bob' -Domain 'domain.local' | Add-UserToSsoGroup -TargetGroup $administratosGroup