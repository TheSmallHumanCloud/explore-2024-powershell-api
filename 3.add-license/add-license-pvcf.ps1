#Add License Keys to SDDC Manager
$LicenseKey_ESXI = "xxxxx-xxxxx-xxxxx-xxxxx-xxxxx"
$Product_ESXI = "ESXI"
$Description_ESXI = "ESXI Key 1"

$LicenseKey_VSAN = "xxxxx-xxxxx-xxxxx-xxxxx-xxxxx"
$Product_VSAN = "VSAN"
$Description_VSAN = "vSAN Key 1"

New-VCFLicenseKey -key $LicenseKey_ESXI -productType $Product_ESXI -description $Description_ESXI
New-VCFLicenseKey -key $LicenseKey_VSAN -productType $Product_VSAN -description $Description_VSAN