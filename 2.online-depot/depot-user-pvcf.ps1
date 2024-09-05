$depot_username = "username"
$depot_password = "password"

Set-VCFDepotCredential `
    -username $depot_username `
    -password $depot_password `
| Out-Null

(Get-VCFDepotCredential).message
