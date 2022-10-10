$equiposautorizados= Get-ADGroupMember "GS Equipos con Administradores Locales" -Recursive | Select Name | foreach-object {$_.Name} 
Import-Csv "devices.txt" | ForEach-Object {
    $device = $_.device + "$"
    try {
        if ($_.device -notin $equiposautorizados) {
            Write-Output "ingresando $device al grupo"
            add-adgroupmember -identity "GS Equipos Sin Administradores Locales" -Members $device
        }

    
    } catch {
        Write-Warning "$device ya estaba en el grupo"
    }
}
