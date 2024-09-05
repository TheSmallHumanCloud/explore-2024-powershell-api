#Commission Hosts
$fqdn1 = "demo-m01-esx17.demo.local"
$fqdn2 = "demo-m01-esx18.demo.local"
$fqdn3 = "demo-m01-esx19.demo.local"
$networkPoolId = (Get-VCFNetworkPool -name "demo-m01-np01").id
$username = "root"
$password = "Password>"

$json = (Get-Content .\vcf-json\commission-host-variables.json -Raw) | ForEach-Object {
    $_ -replace '<<FQDN1>>', $fqdn1 `
        -replace '<<FQDN2>>', $fqdn2 `
        -replace '<<FQDN3>>', $fqdn3 `
        -replace '<<NETWORKPOOLID>>', $networkPoolId `
        -replace '<<HOSTUSERNAME>>', $username `
        -replace '<<HOSTPASSWORD>>', $password `
}
New-VCFCommissionedHost -json $json