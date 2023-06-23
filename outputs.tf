output "rg_location" {
    value = azurerm_resource_group.first_rg.location
    description = "Location of the create resource group"
}

output "iterations_next" {
    value = [for it in var.iterations : it + 2]
}