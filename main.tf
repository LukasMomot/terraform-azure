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

# TODO: Add module with var: env, applications => use in main.tf
resource "azurerm_resource_group" "rg" {
  name = "${upper(var.environment)}-apps-rg"
  location = "West Europe"
}

resource "azurerm_static_site" "static_app" {
  for_each = toset(var.applications)
  
  name = each.key
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_size = "Free"
  sku_tier = "Free"
}