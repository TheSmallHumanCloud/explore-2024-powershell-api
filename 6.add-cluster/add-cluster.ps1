$addhost = Get-Content "C:\James Script Files\commall.json" -raw
$cluster = Get-Content "C:\James Script Files\cluster.json" -raw

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
    "body"    = $addhost
}

$sddc_host = Invoke-RestMethod @Splat -SkipCertificateCheck
$sddc_host.executionStatus

$Splat = @{
    "URI"     = "https://demo-vcf02.demo.local/v1/clusters/validations"
    "Headers" = @{
        'Content-Type'  = "application/json"
        'Accept'        = "application/json"
        'Authorization' = "Bearer $($sddc_token)"
    }
    "Method"  = "POST"
    "body"    = $cluster
}

$sddc_cluster = Invoke-RestMethod @Splat -SkipCertificateCheck
$sddc_cluster.status

$Splat = @{
    "URI"     = "https://demo-vcf02.demo.local/v1/clusters"
    "Headers" = @{
        'Content-Type'  = "application/json"
        'Accept'        = "application/json"
        'Authorization' = "Bearer $($sddc_token)"
    }
    "Method"  = "POST"
    "body"    = $cluster
}

$sddc_cluster = Invoke-RestMethod @Splat -SkipCertificateCheck
$sddc_cluster.status