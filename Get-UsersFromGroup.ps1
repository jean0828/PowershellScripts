Get-AdGroupMember -identity "Group" -Recursive | select name, samaccountname  | Export-csv -path "C:\export.csv" -NoTypeInformation -Encoding UTF8
