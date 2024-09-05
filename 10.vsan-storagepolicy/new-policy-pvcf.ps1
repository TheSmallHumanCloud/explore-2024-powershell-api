#Create Storage Policy

$storagepolicyname = "Demo-Raid-5"

$Splat = @{
"Name" = $storagepolicyname
"Description" = "Demo Raid 5 Storage Policy"
"AnyOfRuleSets" = New-SpbmRuleSet `
(New-SpbmRule -Capability (Get-SpbmCapability -Name "VSAN.hostFailuresToTolerate" ) -Value 1),`
(New-SpbmRule -Capability (Get-SpbmCapability -Name "VSAN.stripeWidth" ) -Value 1),`
(New-SpbmRule -Capability (Get-SpbmCapability -Name "VSAN.replicaPreference" ) -Value "RAID-5/6 (Erasure Coding) - Capacity"),`
(New-SpbmRule -Capability (Get-SpbmCapability -Name "VSAN.iopsLimit" ) -Value 2000)`

}
New-SpbmStoragePolicy @splat

#Assign Storage Policy
$vm = get-vm "demo-m01-edge-03"

    Set-SpbmEntityConfiguration -Configuration (Get-SpbmEntityConfiguration $vm) -StoragePolicy $storagepolicyname
    Set-SpbmEntityConfiguration -Configuration (Get-SpbmEntityConfiguration (get-vm $vm | Get-HardDisk)) -StoragePolicy $storagepolicyname
