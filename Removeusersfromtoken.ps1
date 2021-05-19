$exportlocation = "C:\Users\Public\$(Get-Date -UFormat '%Y%m%d')_removeusers.csv"
$current = Get-Date
$a= Get-ADGroupMember "GS Usuarios Token VPN" -Recursive | Get-ADUser -Properties "LastLogonDate" | Select Name,SamAccountName,LastLogonDate
$a | ForEach-Object {
    if (($current - $_.LastLogonDate).Days -gt 90) {
    $_.SamAccountName, $_.LastLogonDate.ToString("yyyy/MM/dd")
    Remove-ADGroupMember -Identity "GS Usuarios Token VPN" -Members $_.SamAccountName -Confirm:$false -ErrorAction:SilentlyContinue
    }
}

