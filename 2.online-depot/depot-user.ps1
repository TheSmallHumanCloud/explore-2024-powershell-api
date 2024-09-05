$sddc_username = "administrator@vsphere.local"
$sddc_password = "<Password>"
$sddc_depotusername = "user@domain.com"
$sddc_depotpassword = "<Password>"

$Splat = @{
    "URI"     = "https://demo-vcf02.demo.local/v1/tokens"
    "Headers" = @{
        'Content-Type' = "application/json"
        'Accept'       = "application/json"
    }
    "Method"  = "POST"
    "body"    = @{
        username = "$($sddc_username)"
        password = "$($sddc_password)"
    } | ConvertTo-JSON -Depth 6
}
$sddc_token = Invoke-RestMethod @Splat -SkipCertificateCheck | Select-Object -expandproperty accesstoken

$Splat = @{
    "URI"     = "https://demo-vcf02.demo.local/v1/system/settings/depot"
    "Headers" = @{
        'Content-Type'  = "application/json"
        'Accept'        = "application/json"
        'Authorization' = "Bearer $($sddc_token)"
    }
    "Method"  = "PUT"
    "body"    = @{
        vmwareAccount = @{
            username = "$($sddc_depotusername)"
            password = "$($sddc_depotpassword)"
        }
    } | ConvertTo-JSON -Depth 6
}

$depot_result = Invoke-RestMethod @Splat -SkipCertificateCheck | Select-Object -expandproperty vmwareAccount
$depot_result.message