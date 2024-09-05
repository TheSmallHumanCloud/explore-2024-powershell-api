
Connect-SsoAdminServer -Server demo-m01-vc02.demo.local -User administrator@vsphere.local -Password "<Password>" -SkipCertificateCheck

New-VCFIdentityProvider -type Embedded -json .\vcf-json\sso-variables.json