terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

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