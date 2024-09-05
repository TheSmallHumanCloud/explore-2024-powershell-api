#Variables
$object = "demo-m01-esx16.demo.local"
$resource_type = "ESXI"
$username = "root"
$password = "AR3allyGoodPa55Word!!"

#Set root credential
$json = (Get-Content .\vcf-json\update-cred.json -raw) | ForEach-Object {
    $_ -replace '<<RESOURCENAME>>', $object `
        -replace '<<RESOURCETYPE>>', $resource_type `
        -replace '<<USERNAME>>', $username `
        -replace '<<PASSWORD>>', $password `
}

Set-VCFCredential -json $json

#Rotate root Credential
$json = (Get-Content .\vcf-json\rotate-cred.json -raw) | ForEach-Object {
    $_ -replace '<<RESOURCENAME>>', $object `
        -replace '<<RESOURCETYPE>>', $resource_type `
        -replace '<<USERNAME>>', $username `
}

Set-VCFCredential -json $json

#Get Credentials
Get-VCFCredential -resourceName $object | Where-Object { $_.username -eq $username }

#Set Rotation Policy
# VCENTER,PSC,ESXI,BACKUP,NSXT_MANAGER,NSXT_EDGE,VRSLCM,WSA,VROPS,VRLI,VRA
Set-VCFCredentialAutoRotatePolicy -resourceName "demo-m01-nsx02.demo.local" -resourceType NSXT_MANAGER -credentialType SSH -username audit -autoRotate ENABLED -frequencyInDays 30

#Get Credential Expiry
Get-VCFCredentialExpiry -resourceName "demo-m01-nsx02.demo.local" -resourceType NSXT_MANAGER
