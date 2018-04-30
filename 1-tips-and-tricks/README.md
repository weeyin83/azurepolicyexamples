![alt text](./images/azurepolicyimage.jpg "Azure Policy Tips and Tricks")

# Tips and Tricks

Below are some tips and tricks that I picked up while working with Azure Policy - enjoy!

# Table of contents

- [Assigning policies with PowerShell or CLI](#assigning-policies-with-powershell-or-cli)
    + [PowerShell Example](#powershell-example)
    + [CLI Example](#cli-example)
- [Syntax for Parameters](#syntax-for-parameters)
    + [GUI Syntax](#gui-syntax)
    + [Code Syntax](#code-syntax)

## Assigning policies with PowerShell or CLI

When you create policy assignments with PowerShell or CLI remember to assign a pricing tier/SKU within your command.  If you don't specify a pricing tier/SKU it will automatically default to the Free tier.  With the Free tier you can only enforce policies on future resources, with Standard, you can also enforce them on existing resources. 

Within PowerShell use the following addition to your New-AzureRMPolicyAssignment command:

**-sku @{"Name" = "A1"; "Tier" = "Standard"}**

Wthin CLI use the following addition to your az policy assignment create command:

**--sku 'standard'**

### PowerShell Example
Below is an example of the code you would use to create a policy definition with PowerShell and then create the policy assignment including the Standard SKU.

````powershell
#Define allowed publishers
$allowedpublishers = "Canonical", "MicrosoftWindowsServer", "RedHat"

#Define ResourceGroup Policy will be applied to
$ResourceGroup = Get-AzureRMResourceGroup -Name "ResourceGroup1"

#Setup Policy Defintion
$definition = New-AzureRmPolicyDefinition -Name "allowed-image-publishers-policy" -DisplayName "Only allow a certain image publishers offerings to be deployed" -description "This policy ensures that only allowed image publisher offerings are selected from the image repository" -Policy 'https://raw.githubusercontent.com/weeyin83/azurepolicyexamples/master/Compute/allowed-image-publishers/azurepolicy.rules.json' -Parameter 'https://raw.githubusercontent.com/weeyin83/azurepolicyexamples/master/Compute/allowed-image-publishers/azurepolicy.parameters.json' -Mode All
$definition

#Create Policy assignment using the new definition
$assignment = New-AzureRMPolicyAssignment -Name "Canonical-RedHat-WindowsServer-only-policy" -Scope $ResourceGroup.ResourceId -sku @{"Name" = "A1"; "Tier" = "Standard"} -listOfAllowedimagePublisher $allowedpublishers -PolicyDefinition $definition
$assignment
````

### CLI Example

Below is an example of the code you would use to create a policy definition with CLI and then create the policy assignment including the Standard SKU.

````cli

az policy definition create --name 'enforce-storage-skus' --display-name 'Ensure deployment of allowed Storage SKUs only' --description 'Ensure only approved Storage SKUs can be deployed' --rules 'https://raw.githubusercontent.com/weeyin83/azurepolicyexamples/master/Storage/enforce-storage-skus/azurepolicy.rules.json' --params 'https://raw.githubusercontent.com/weeyin83/azurepolicyexamples/master/Storage/enforce-storage-skus/azurepolicy.parameters.json' --mode All

az policy assignment create --name 'enforce storage' --scope '/subscriptions/00000000-0000-0000-000000000000' --policy "enforce-storage-skus" --params '{"listOfAllowedSKUs":{"value": [ "Standard_GRS"]}}' --sku 'standard'
````

## Syntax for Parameters

When you create a policy definition you can choose to have a field that uses dynamic entries.

### GUI Syntax

When you use try to create an assignment of one of the policies you will be asked for the values, within the GUI the synatx for adding multiple values use a **;** between values with no spaces.  Below is a screenshot demonstrating this syntax:

![alt text](./images/parametersyntax.PNG "GUI Parameter Syntax")

### Code Syntax

When you are using static parameter entries within your policy definitions the correct syntax for adding mutliple values is to using quotation marks around each entry, followed by a comma and then a space before the next value.  Below is a screenshot demonstrating this:

![alt text](./images/parametersyntax1.png "Code Parameter Syntax")