﻿$nameofgroup= 'Security Group Devices'
$groupsusers=Get-ADGroup -Identity $nameofgroup | 
  ForEach-Object{
                $settings=@{Group=$_.DistinguishedName;Member=$null}
        $_ | Get-ADGroupMember |
              ForEach-Object{
                                       $settings.Member=$_.DistinguishedName
                    New-Object PsObject -Property $settings
                }
    }
    $groupsusers | Export-Csv C:\devices.csv –NoTypeInformation
