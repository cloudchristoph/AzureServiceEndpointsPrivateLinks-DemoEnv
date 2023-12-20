New-AzSubscriptionDeploymentStack `
    -Name "CloudFamily-Demo" `
    -Location "westeurope" `
    -TemplateFile "./BaseInfra/BaseInfra.bicep" `
    -TemplateParameterFile "./BaseInfra/BaseInfra.bicepparam" `
    -DenySettingsMode "None" `
    -Verbose