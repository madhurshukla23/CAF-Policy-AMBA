# Configure Terraform to set the required AzureRM provider
# version and features{} block.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.107"
    }
  }
  # backend "azurerm" {
  # }
}

# Define the provider configuration
provider "azurerm" {
  features {}
  #subscription_id = "69d44ddb-32ac-4584-a7d7-7db713da42ac"
  #use_oidc = true
}

# Get the current client configuration from the AzureRM provider.
data "azurerm_client_config" "current" {}

# Declare the Azure landing zones Terraform module
# and provide the core configuration.
module "alz" {
  # To enable correct testing of our examples, we must source this
  # module locally. Please remove the local `source = "../../../"`
  # and uncomment the remote `source` and `version` below.
  # source = "git@github.com:VFGroup-MCS-DCC/mcs-azure-landingzone-modules.git//modules?ref=v1.0.1"  
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "6.0.0"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  # Base module configuration settings
  root_parent_id   = data.azurerm_client_config.current.tenant_id
  root_id          = var.root_id
  root_name        = var.root_name
  library_path     = "${path.module}/lib"
  default_location = "eastus"

  # Enable creation of the core management group hierarchy
  # and additional custom_landing_zones
  disable_telemetry         = false
  deploy_core_landing_zones = false
  custom_landing_zones      = local.custom_landing_zones
}
