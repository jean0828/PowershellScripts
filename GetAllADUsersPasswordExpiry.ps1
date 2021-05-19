﻿Get-ADUser -filter * –Properties "SamAccountName","DisplayName", "msDS-UserPasswordExpiryTimeComputed", "EmailAddress","Enabled","Company","Title","Department","PostalCode","LastLogonDate","LastBadPasswordAttempt","PasswordExpired","PasswordLastSet","badPwdCount", "CanonicalName" |
Select-Object -Property "SamAccountName",  "EmailAddress","Enabled","Company","Title","Department","PostalCode","LastLogonDate","LastBadPasswordAttempt","PasswordExpired","PasswordLastSet","badPwdCount", "Displayname",@{Name="ExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}, "CanonicalName" |
Export-CSV "C:\adusers.csv" -NoTypeInformation -Encoding UTF8
