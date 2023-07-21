terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate30264"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "webpage_azure_pipelines" {
  source = "./modules/full_webpage"

  for_each = toset(["dev", "uat", "prod"])

  application = "azure-pipelines"
  environment = each.key
}

module "webpage_angular_standalone_actions" {
  source = "./modules/full_webpage"

  for_each = toset(["dev"])

  application = "angular-standalone-actions"
  environment = each.key
}

# resource "azurerm_resource_group" "rg" {
#   name = "${upper(var.environment)}-apps-rg"
#   location = "West Europe"
# }

# resource "azurerm_static_site" "static_app" {
#   for_each = toset(var.applications)

#   name = each.key
#   location = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   sku_size = "Free"
#   sku_tier = "Free"
# }