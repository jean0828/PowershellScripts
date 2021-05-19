$exportlocation = "C:\$(Get-Date -UFormat '%Y%m%d')_removeusers.csv"
$current = Get-Date
$a= Get-ADGroupMember "Group1" -Recursive | Get-ADUser -Properties "LastLogonDate" | Select Name,SamAccountName,LastLogonDate
$a | ForEach-Object {
    if (($current - $_.LastLogonDate).Days -gt 90) {
    $string = [pscustomobject]@{
    "Name" = $_.SamAccountName
    "LastLogon" = $_.LastLogonDate.ToString("yyyy/MM/dd")
    } 
    $string | Export-Csv -Path $exportlocation -Append -NoTypeInformation 
    }
}

