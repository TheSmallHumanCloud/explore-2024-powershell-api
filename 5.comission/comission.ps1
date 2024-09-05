$addhost = Get-Content "C:\James Script Files\commall.json" -raw

$Splat = @{
    "URI"     = "https://demo-vcf02.demo.local/v1/hosts/validations"
    "Headers" = @{
        'Content-Type'  = "application/json"
        'Accept'        = "application/json"
        'Authorization' = "Bearer $($sddc_token)"
    }
    "Method"  = "POST"
    "body"    = $addhost
}

$add_host = Invoke-RestMethod @Splat -SkipCertificateCheck
$add_host.message

$Splat = @{
    "URI"     = "https://demo-vcf02.demo.local/v1/hosts"
    "Headers" = @{
        'Content-Type'  = "application/json"
        'Accept'        = "application/json"
        'Authorization' = "Bearer $($sddc_token)"
    }
    "Method"  = "POST"
    "body"    = $addhost
}

$add_host = Invoke-RestMethod @Splat -SkipCertificateCheck
$add_host.message