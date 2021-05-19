$file = Read-Host -Prompt 'Input the file name'
$filename= 'C:\users\public\'+$file + '.csv'
Get-ADcomputer -filter '*' -Properties * | select Name, OperatingSystem,CanonicalName,LastLogonDate | Export-Csv $filename  -NoTypeInformation -Encoding UTF8
