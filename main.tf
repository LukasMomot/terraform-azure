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

resource "azurerm_resource_group" "first_rg" {
  name = "${upper(var.environment)}-first-rg"
  location = "West Europe"
}

resource "azurerm_static_site" "standalone" {
  name = "app-ng-standalone"
  location = azurerm_resource_group.first_rg.location
  resource_group_name = azurerm_resource_group.first_rg.name
  sku_size = "Free"
  sku_tier = "Free"
}