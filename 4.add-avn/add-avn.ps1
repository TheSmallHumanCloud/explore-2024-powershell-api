$avnjson = Get-Content "C:\James Script Files\avn.json" -raw

$Splat = @{
    "URI"     = "https://demo-vcf02.demo.local/v1/avns/validations"
    "Headers" = @{
        'Content-Type'  = "application/json"
        'Accept'        = "application/json"
        'Authorization' = "Bearer $($sddc_token)"
    }
    "Method"  = "POST"
    "body"    = $avnjson
}

$add_avn = Invoke-RestMethod @Splat -SkipCertificateCheck
$add_avn.message

$Splat = @{
    "URI"     = "https://demo-vcf02.demo.local/v1/avns"
    "Headers" = @{
        'Content-Type'  = "application/json"
        'Accept'        = "application/json"
        'Authorization' = "Bearer $($sddc_token)"
    }
    "Method"  = "POST"
    "body"    = $avnjson
}

$add_avn = Invoke-RestMethod @Splat -SkipCertificateCheck
$add_avn.message

