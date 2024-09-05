#Commission Hosts
$fqdn1 = "demo-m01-esx14.demo.local"
$fqdn2 = "demo-m01-esx15.demo.local"
$fqdn3 = "demo-m01-esx16.demo.local"
$networkPoolId = (Get-VCFNetworkPool -name "demo-m01-np01").id
$username = "root"
$password = "<Password>"

$json = (Get-Content .\vcf-json\commission-host-variables.json -Raw) | ForEach-Object {
    $_ -replace '<<FQDN1>>', $fqdn1 `
        -replace '<<FQDN2>>', $fqdn2 `
        -replace '<<FQDN3>>', $fqdn3 `
        -replace '<<NETWORKPOOLID>>', $networkPoolId `
        -replace '<<HOSTUSERNAME>>', $username `
        -replace '<<HOSTPASSWORD>>', $password `
}
$result = New-VCFCommissionedHost -json $json

while ( (Get-VCFTask ${result}.id).status -ne "Successful" ) {
    Write-host "Host commission in-progress..."
    Start-Sleep -Second 15
}

#Deploy Workload Domain
$hostid1 = (Get-VCFHost -fqdn $fqdn1).id
$hostid2 = (Get-VCFHost -fqdn $fqdn2).id
$hostid3 = (Get-VCFHost -fqdn $fqdn3).id

$wld_json = (Get-Content .\vcf-json\wld-variables.json -Raw) | ForEach-Object {
    $_ -replace '<<HOSTID1>>', $hostid1 `
        -replace '<<HOSTID2>>', $hostid2 `
        -replace '<<HOSTID3>>', $hostid3 `
}

$wldresult = New-VCFWorkloadDomain -json $wld_json
