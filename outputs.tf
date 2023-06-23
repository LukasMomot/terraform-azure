output "rg_location" {
    value = azurerm_resource_group.first_rg.location
    description = "Location of the create resource group"
}

output "iterations_next" {
    value = [for it in var.iterations : it + 2]
}

output "app_standalone_key" {
    value = nonsensitive(azurerm_static_site.standalone.api_key)
    # sensitive = true
}

output "app_standalone_host" {
    value = azurerm_static_site.standalone.default_host_name
}