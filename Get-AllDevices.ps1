$file = Read-Host -Prompt 'Input the file name'
$filename= './'+$file + '.csv'
Get-ADcomputer -filter * -properties * | select Name,IPv4Address,OperatingSystem,CanonicalName,LastLogonDate | Export-Csv $filename -NoTypeInformation -Encoding UTF8
