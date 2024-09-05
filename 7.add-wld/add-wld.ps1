$wld = Get-Content "C:\James Script Files\wld.json" -raw
$addhost1 = Get-Content "C:\James Script Files\commall.json" -raw

$Splat = @{
    "URI"     = "https://demo-vcf02.demo.local/v1/hosts/validations"
    "Headers" = @{
        'Content-Type'  = "application/json"
        'Accept'        = "application/json"
        'Authorization' = "Bearer $($sddc_token)"
    }
    "Method"  = "POST"
    "body"    = $addhost1
}

$sddc_host = Invoke-RestMethod @Splat -SkipCertificateCheck
$sddc_host.executionStatus

$Splat = @{
    "URI"     = "https://demo-vcf02.demo.local/v1/hosts"
    "Headers" = @{
        'Content-Type'  = "application/json"
        'Accept'        = "application/json"
        'Authorization' = "Bearer $($sddc_token)"
    }
    "Method"  = "POST"
    "body"    = $addhost1
}

$sddc_host = Invoke-RestMethod @Splat -SkipCertificateCheck
$sddc_host.executionStatus

$Splat = @{
    "URI"     = "https://demo-vcf02.demo.local/v1/domains/validations"
    "Headers" = @{
        'Content-Type'  = "application/json"
        'Accept'        = "application/json"
        'Authorization' = "Bearer $($sddc_token)"
    }
    "Method"  = "POST"
    "body"    = $wld
}

$sddc_wld = Invoke-RestMethod @Splat -SkipCertificateCheck
$sddc_wld.resultstatus

$Splat = @{
    "URI"     = "https://demo-vcf02.demo.local/v1/domains"
    "Headers" = @{
        'Content-Type'  = "application/json"
        'Accept'        = "application/json"
        'Authorization' = "Bearer $($sddc_token)"
    }
    "Method"  = "POST"
    "body"    = $wld
}

$sddc_wld = Invoke-RestMethod @Splat -SkipCertificateCheck
$sddc_wld.resultstatus