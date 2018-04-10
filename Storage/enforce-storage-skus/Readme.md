# Deny unapproved Storage SKUs

Ensure only approved Storage SKUs can be deployed


## Try on Portal

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/?feature.customportal=false&microsoft_azure_policy=true&microsoft_azure_policy_policyinsights=true&feature.microsoft_azure_security_policy=true&microsoft_azure_marketplace_policy=true#blade/Microsoft_Azure_Policy/CreatePolicyDefinitionBlade/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fweeyin83%2Fazurepolicyexamples%2Fmaster%2FStorage%2enforce-storage-skus%2Fazurepolicy.json)


## Try with PowerShell

````powershell
$definition = New-AzureRmPolicyDefinition -Name "enforce-storage-skus" -DisplayName "Ensure deployment of allowed Storage SKUs only" -description "Ensure only approved Storage SKUs can be deployed" -Policy 'https://raw.githubusercontent.com/weeyin83/azurepolicyexamples/master/Storage/enforce-storage-skus/azurepolicy.rules.json' -Parameter 'https://raw.githubusercontent.com/weeyin83/azurepolicyexamples/master/Storage/enforce-storage-skus/azurepolicy.parameters.json' -Mode All
$definition
$assignment = New-AzureRMPolicyAssignment -Name <assignmentname> -Scope <scope>  -PolicyDefinition $definition
$assignment 
````


## Try with CLI

````cli

az policy definition create --name 'enforce-storage-skus' --display-name 'Ensure deployment of allowed Storage SKUs only' --description 'Ensure only approved Storage SKUs can be deployed' --rules 'https://raw.githubusercontent.com/weeyin83/azurepolicyexamples/master/Storage/enforce-storage-skus/azurepolicy.rules.json' --params 'https://raw.githubusercontent.com/weeyin83/azurepolicyexamples/master/Storage/enforce-storage-skus/azurepolicy.parameters.json' --mode All

az policy assignment create --name <assignmentname> --scope <scope> --policy "enforce-storage-skus" 

````

## CLI Example 1

Deploys the policy to an entire subscription, using the Standard Azure Policy price tier and only allows Standard GRS storage to be used. 

````cli

az policy definition create --name 'enforce-storage-skus' --display-name 'Ensure deployment of allowed Storage SKUs only' --description 'Ensure only approved Storage SKUs can be deployed' --rules 'https://raw.githubusercontent.com/weeyin83/azurepolicyexamples/master/Storage/enforce-storage-skus/azurepolicy.rules.json' --params 'https://raw.githubusercontent.com/weeyin83/azurepolicyexamples/master/Storage/enforce-storage-skus/azurepolicy.parameters.json' --mode All

az policy assignment create --name 'enforce storage' --scope '/subscriptions/00000000-0000-0000-000000000000' --policy "enforce-storage-skus" --params '{"listOfAllowedSKUs":{"value": [ "Standard_GRS"]}}' --sku 'standard'
