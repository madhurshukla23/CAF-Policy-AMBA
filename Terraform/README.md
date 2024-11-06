<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.107 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.107 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alz"></a> [alz](#module\_alz) | Azure/caf-enterprise-scale/azurerm | 6.0.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_primary_location"></a> [primary\_location](#input\_primary\_location) | Sets the location for "primary" resources to be created in. | `string` | `"northeurope"` | no |
| <a name="input_root_id"></a> [root\_id](#input\_root\_id) | Sets the value used for generating unique resource naming within the module. | `string` | `"Test"` | no |
| <a name="input_root_name"></a> [root\_name](#input\_root\_name) | Sets the value used for the "intermediate root" management group display name. | `string` | `"Test"` | no |
| <a name="input_secondary_location"></a> [secondary\_location](#input\_secondary\_location) | Sets the location for "secondary" resources to be created in. | `string` | `"westeurope"` | no |

Change the value of ALZMonitorResourceGroupName to the name of the resource group where the activity logs, resource health alerts, actions groups and alert processing rules will be deployed in.

Change the value of ALZMonitorResourceGroupLocation to specify the location for said resource group.

Change the value of ALZLogicappResourceId to the Logic app resource id to be used as action for the alerts (including Service Health alerts). Leave the value blank if no Logic app is used.

Change the value of ALZLogicappCallbackUrl to the Logic app callback url of the Logic app you want to use as action for the alerts (including Service Health alerts). Leave the value blank if no Logic app is used. To retrieve the callback url you can either use the Get-AzLogicAppTriggerCallbackUrl PowerShell command or navigate to the Logic app in the Azure portal, go to Logic app designer, expand the trigger activity (When an HTTP request is received) and copy the value in the URL field using the 2-sheets icon.

## Outputs

No outputs.
<!-- END_TF_DOCS -->