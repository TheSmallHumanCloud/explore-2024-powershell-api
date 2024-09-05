
Connect-SsoAdminServer -Server demo-m01-vc02.demo.local -User administrator@vsphere.local -Password "<Password>" -SkipCertificateCheck

Add-LDAPIdentitySource `
    -Name 'demo lab' `
    -DomainName 'domain.local' `
    -DomainAlias 'domain.local' `
    -PrimaryUrl 'ldap://addc01.domain.local:389' `
    -BaseDNUsers 'CN=Users,DC=domain,DC=local' `
    -BaseDNGroups 'CN=Users,DC=domain,DC=local' `
    -Username 'svc-vc@domain.local' `
    -Password '<Password>'










