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