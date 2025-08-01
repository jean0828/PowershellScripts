#Connect-AzureAD
$Usuarios = Import-Csv -Path ".\correos.csv"  # La columna debe llamarse userprincipalname

$Resultados = @()


foreach ($u in $Usuarios) {
    $user = Get-AzureADUser -ObjectId $u.userprincipalname| select UserPrincipalName,AccountEnabled
    $Resultados += [PSCustomObject]@{
        UserPrincipalName = $u.userprincipalname
        AccountEnabled = $user.AccountEnabled
    }
}

# Exportar resultados a CSV
$Resultados | Export-Csv -Path ".\EstadoUsuarios.csv" -NoTypeInformation

