# Audit your resources for a specific tag

Audit to ensure your resources are being tagged with a specific tag.  This template currently audits the following resources:

* Resource Groups
* Virtual Machines
* Virtual Machine Scale Sets
* Storage Accounts
* Automation Accounts
* Runbooks
* Network Interfaces
* Network Security Groups
* Public IP Address
* Virtual Networks
* Disks
* MySQL Server
* Cosmos DB Servers
* Load Balancers
* SQL Databases

## Try on Portal

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/?feature.customportal=false&microsoft_azure_policy=true&microsoft_azure_policy_policyinsights=true&feature.microsoft_azure_security_policy=true&microsoft_azure_marketplace_policy=true#blade/Microsoft_Azure_Policy/CreatePolicyDefinitionBlade/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fweeyin83%2Fazurepolicyexamples%2Fmaster%2FTagging%2Faudit-resource-tag%2Fazurepolicy.json)

## Try with PowerShell

````powershell
$definition = New-AzureRmPolicyDefinition -Name "audit-resource-tag" -DisplayName "Audit for specific resource tag" -description "Audit to ensure your resources are being tagged with a specific tag" -Policy 'https://raw.githubusercontent.com/weeyin83/azurepolicyexamples/master/Tagging/audit-resource-tag/azurepolicy.rules.json' -Parameter 'https://raw.githubusercontent.com/weeyin83/azurepolicyexamples/master/ATagging/audit-resource-tag/azurepolicy.parameters.json' -Mode Indexed
$definition
$assignment = New-AzureRMPolicyAssignment -Name <assignmentname> -Scope <scope>  -PolicyDefinition $definition
$assignment
````

## Try with CLI

````cli

az policy definition create --name 'audit-resource-tag' --display-name 'Audit for specific resource tag' --description 'Audit to ensure your resources are being tagged with a specific tag' --rules 'https://raw.githubusercontent.com/weeyin83/azurepolicyexamples/master/Tagging/audit-resource-tag/azurepolicy.rules.json' --params 'https://raw.githubusercontent.com/weeyin83/azurepolicyexamples/master/Tagging/audit-resource-tag/azurepolicy.parameters.json' --mode Indexed

az policy assignment create --name '<assignmentname>' --scope '<scope>' --policy 'audit-location-deployments'

````