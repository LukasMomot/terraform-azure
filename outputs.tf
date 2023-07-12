output "rg_location" {
    value = azurerm_resource_group.rg.location
    description = "Location of the create resource group"
}

output "iterations_next" {
    value = [for it in var.iterations : it + 2]
}

# TODO: Add this to object/map
output "app_standalone_key" {
    value = values(azurerm_static_site.static_app).*.api_key
    sensitive = true
}

output "app_standalone_host" {
    value = values(azurerm_static_site.static_app).*.default_host_name
}