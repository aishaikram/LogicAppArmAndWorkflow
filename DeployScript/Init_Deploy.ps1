Connect-AzAccount
Get-AzSubscription

$context = Get-AzSubscription -SubscriptionId 10ada5ed-74b4-4a28-a048-050f6e9973b7
Set-AzContext $context


Set-AzDefault -ResourceGroupName LiaisonIntegrationServicesTest

Set-Location infrastructure

$templateFile = "template.json"
$parameterFile = "parameters.json"
$today = Get-Date -Format "MM-dd-yyyy"
$deploymentName = "ArmDeployLAComplete" + "$today"

New-AzResourceGroupDeployment `
    -Name $deploymentName `
    -TemplateFile $templateFile `
    -TemplateParameterFile $parameterFile `
    -WhatIf `
    -WhatIfResultFormat ResourceIdOnly 