Connect-MgGraph 
#Set the properties to retrieve
$Properties = @(
    "id",
    "DisplayName",
    "userprincipalname",
    "PasswordPolicies",
    "lastPasswordChangeDateTime",
    "mail",
    "jobtitle",
    "department"
    )
 
#Retrieve the password change date timestamp of all users
$AllUsers = Get-MgUser -All -Property $Properties | Select -Property $Properties
 
#Export to CSV
$AllUsers | Export-Csv -Path ".\PasswordChangeTimeStamp.csv" -NoTypeInformation