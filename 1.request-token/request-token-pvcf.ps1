$password = "<Password>"

Request-VCFToken `
    -fqdn "demo-vcf02.demo.local" `
    -username "administrator@vsphere.local" `
    -password $password

Connect-VIServer `
    -server "demo-m01-vc02.demo.local" `
    -username "administrator@vsphere.local" `
    -password $password
