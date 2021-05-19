Get-AdGroupMember -identity "Active Directory Group where is the devices" -Recursive | select name, distinguishedName  | Export-csv -path "C:\export.csv" -NoTypeInformation -Encoding UTF8
