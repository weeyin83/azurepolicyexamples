![alt text](./images/azurepolicy.jgp "Azure Policy Tips and Tricks")

# Tips and Tricks

## Assigning policies with PowerShell or CLI

When you create policy assignments with PowerShell or CLI remember to assign a pricing tier/SKU within your command.  If you don't specify a pricing tier/SKU it will automatically default to the Free tier.  With the Free tier you can only enforce policies on future resources, with Standard, you can also enforce them on existing resources. 

Within PowerShell use the following addition to your New-AzureRMPolicyAssignment command: 

**-sku @{"Name" = "A1"; "Tier" = "Standard"}**

Wthin CLI use the following addition to your az policy assignment create command: 

**--sku 'standard'**