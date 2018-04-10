# Audit for approved datacentre locations

Ensure approved datacentres are being utilised for deployed resources


## Try on Portal

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/?feature.customportal=false&microsoft_azure_policy=true&microsoft_azure_policy_policyinsights=true&feature.microsoft_azure_security_policy=true&microsoft_azure_marketplace_policy=true#blade/Microsoft_Azure_Policy/CreatePolicyDefinitionBlade/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fweeyin83%2Fazurepolicyexamples%2Fmaster%2FAudit-Policies%2FLocation%2Fazurepolicy.json)


## Try with PowerShell

````powershell
$definition = New-AzureRmPolicyDefinition -Name "audit-location-deployments" -DisplayName "Audit for approved datacentre locations" -description "Ensure approved datacentres are being utilised for deployed resources" -Policy 'https://raw.githubusercontent.com/weeyin83/azurepolicyexamples/master/Audit-Policies/Location/azurepolicy.rules.json' -Parameter 'https://raw.githubusercontent.com/weeyin83/azurepolicyexamples/master/Audit-Policies/Location/azurepolicy.parameters.json' -Mode All
$definition
$assignment = New-AzureRMPolicyAssignment -Name <assignmentname> -Scope <scope>  -PolicyDefinition $definition
$assignment 
````


## Try with CLI

````cli

az policy definition create --name 'audit-location-deployments' --display-name 'Audit for approved datacentre locations' --description 'Ensure approved datacentres are being utilised for deployed resources' --rules 'https://raw.githubusercontent.com/weeyin83/azurepolicyexamples/master/Audit-Policies/Location/azurepolicy.rules.json' --params 'https://raw.githubusercontent.com/weeyin83/azurepolicyexamples/master/Audit-Policies/Location/azurepolicy.parameters.json' --mode All

az policy assignment create --name <assignmentname> --scope <scope> --policy "audit-location-deployments" 

````
