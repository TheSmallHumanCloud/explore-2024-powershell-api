#Commission Hosts
$fqdn1 = "demo-m01-esx17.demo.local"
$fqdn2 = "demo-m01-esx18.demo.local"
$fqdn3 = "demo-m01-esx19.demo.local"
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

#Deploy Cluster
$hostid1 = (Get-VCFHost -fqdn $fqdn1).id
$hostid2 = (Get-VCFHost -fqdn $fqdn2).id
$hostid3 = (Get-VCFHost -fqdn $fqdn3).id

$cluster_json = (Get-Content .\vcf-json\cluster-variables.json -Raw) | ForEach-Object {
    $_ -replace '<<HOSTID1>>', $hostid1 `
        -replace '<<HOSTID2>>', $hostid2 `
        -replace '<<HOSTID3>>', $hostid3 `
}

New-VCFCluster -json $cluster_json