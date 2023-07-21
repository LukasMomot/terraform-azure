locals {
  application = lower(var.application)
  environment = lower(var.environment)
}


resource "azurerm_resource_group" "rg" {
  name = "${local.environment}-rg-${local.application}"
  location = "West Europe"
}

resource "azurerm_static_site" "static_app" {  
  name = local.application
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_size = "Free"
  sku_tier = "Free"
}