$sddc_username = "administrator@vsphere.local"
$sddc_password = "<Password>"

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

$sddc_token