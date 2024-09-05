$Splat = @{
    "URI"     = "https://demo-vcf02.demo.local/v1/license-keys"
    "Headers" = @{
        'Content-Type'  = "application/json"
        'Accept'        = "application/json"
        'Authorization' = "Bearer $($sddc_token)"
    }
    "Method"  = "POST"
    "body"    = @{
        key         = "xxxxx-xxxxx-xxxxx-xxxxx-xxxxx"
        productType = "ESXI"
        description = "ESXI License Key"
    } | ConvertTo-JSON -Depth 6
}

Invoke-RestMethod @Splat -SkipCertificateCheck | Out-Null
