Import-Module Az
Connect-AzAccount

$folderpath = "C:\Users\jsantamariaordonez\OneDrive - Inovatec Systems Corporation\Documents\Reports"
$outputPath = Join-Path $folderpath "public-ips-$(get-date -f yyyy-MM-dd).csv"
"Subscription,Name,IP,443Open,80Open,3389Open,22Open" | Out-File -Encoding utf8 -FilePath $outputPath


$subscriptions = Get-AzSubscription



foreach ($subscription in $subscriptions) {
    Get-AzSubscription -SubscriptionId $subscription -TenantId $subscription.TenantId | Set-AzContext
    $publicips = Get-AzPublicIpAddress
    foreach ($publicip in $publicips) {
        $port80open = $false
        $portrdpopen = $false
        $portsshpopen = $false
        $port443open = $false
        write-host $publicip.ipaddress 
        $subscription.Name,$publicip.Name.ToString(),$publicip.ipaddress.ToString(),$port80open,$port443open,$portrdpopen,$portsshpopen -join ","  |  Out-File -Encoding utf8 -Append -FilePath $outputPath
    }
    



}
