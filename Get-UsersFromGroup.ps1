Get-AdGroupMember -identity "AD Group" -Recursive | Get-ADUser -Properties LastLogonDate | Select Name,SamAccountName,LastLogonDate | Export-csv -path ".\mfa.csv" -NoTypeInformation -Encoding UTF8
